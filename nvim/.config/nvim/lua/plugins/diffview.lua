-- Empty blob hash — still present for `git add -N` intent-to-add entries.
local EMPTY_BLOB = "e69de29bb2d1d6434b8b29ae775ad8c2e48c5391"

---@type string[]
local intent_added = {}

local function git_root()
  return (LazyVim.root.git()) or vim.fn.getcwd()
end

---@param args string[]
local function git(args)
  local cmd = vim.list_extend({ "git", "-C", git_root() }, args)
  return vim.fn.systemlist(cmd), vim.v.shell_error
end

---Intent-to-add untracked files so they appear in branch diffs.
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
  vim.list_extend(args, intent_added)
  git(args)
end

---Drop intent-to-add entries we created (skip files the user fully staged).
local function clear_intent_add()
  if #intent_added == 0 then
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
  vim.list_extend(args, to_reset)
  git(args)
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
            picker:close()
            local base = item and item.branch
            if not base or base == "" then
              return
            end
            clear_intent_add()
            intent_add_untracked()
            vim.cmd.DiffviewOpen(base .. "...HEAD --imply-local")
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
