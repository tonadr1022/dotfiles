-- Empty blob hash — present for `git add -N` intent-to-add entries.
local EMPTY_BLOB = "e69de29bb2d1d6434b8b29ae775ad8c2e48c5391"

---@type string[]
local intent_added = {}

-- Skip clear while DiffviewOpen may close a previous view (would undo add -N).
local suppress_clear = false

local function git_root()
  local out = vim.fn.systemlist({ "git", "rev-parse", "--show-toplevel" })
  if vim.v.shell_error == 0 and out[1] and out[1] ~= "" then
    return out[1]
  end
  local root = LazyVim and LazyVim.root and LazyVim.root.git() or nil
  if type(root) == "string" and root ~= "" then
    return root
  end
  return vim.fn.getcwd()
end

---@param args string[]
---@return string[], integer
local function git(args)
  local cmd = { "git", "-C", git_root() }
  for _, a in ipairs(args) do
    cmd[#cmd + 1] = a
  end
  local out = vim.fn.systemlist(cmd)
  return out, vim.v.shell_error
end

local function intent_add_untracked()
  intent_added = {}
  local files, code = git({ "ls-files", "--others", "--exclude-standard" })
  if code ~= 0 then
    return
  end

  for _, f in ipairs(files) do
    if f ~= "" then
      intent_added[#intent_added + 1] = f
    end
  end

  if #intent_added == 0 then
    return
  end

  local args = { "add", "-N", "--" }
  for _, f in ipairs(intent_added) do
    args[#args + 1] = f
  end
  local _, add_code = git(args)
  if add_code ~= 0 then
    vim.notify("diffview: git add -N failed", vim.log.levels.WARN)
  end
end

local function clear_intent_add()
  if suppress_clear or #intent_added == 0 then
    return
  end

  local to_reset = {}
  for _, f in ipairs(intent_added) do
    local out = git({ "ls-files", "--stage", "--", f })
    local hash = out[1] and out[1]:match("^%S+%s+(%x+)")
    if hash == EMPTY_BLOB then
      to_reset[#to_reset + 1] = f
    end
  end
  intent_added = {}

  if #to_reset == 0 then
    return
  end

  local args = { "reset", "-q", "--" }
  for _, f in ipairs(to_reset) do
    args[#args + 1] = f
  end
  git(args)
end

local function open_against_base(base)
  if not base or base == "" then
    vim.notify("diffview: no base branch selected", vim.log.levels.WARN)
    return
  end
  -- Normalize "remotes/origin/foo" → "origin/foo"
  base = base:gsub("^remotes/", "")

  clear_intent_add()
  intent_add_untracked()

  suppress_clear = true
  local ok, err = pcall(vim.cmd, "DiffviewOpen " .. base .. "...HEAD --imply-local")
  vim.schedule(function()
    suppress_clear = false
  end)
  if not ok then
    suppress_clear = false
    clear_intent_add()
    vim.notify("diffview: " .. tostring(err), vim.log.levels.ERROR)
  end
end

return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
  opts = {
    hooks = {
      view_closed = function()
        clear_intent_add()
      end,
    },
  },
  keys = {
    {
      "<leader>gd",
      function()
        Snacks.picker.git_branches({
          all = true,
          title = "Diff base → HEAD",
          confirm = function(picker, item)
            local base = item and (item.branch or item.name)
            if (not base or base == "") and item and item.text then
              -- e.g. "  main  abc1234 message"
              base = item.text:match("^[%s*]+(%S+)")
            end
            picker:close()
            vim.schedule(function()
              open_against_base(base)
            end)
          end,
        })
      end,
      desc = "Diff vs base (editable)",
    },
    {
      "<leader>gD",
      "<cmd>DiffviewClose<cr>",
      desc = "Close Diffview",
    },
  },
}
