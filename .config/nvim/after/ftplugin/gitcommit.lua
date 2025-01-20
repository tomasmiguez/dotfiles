-- https://www.jonashietala.se/blog/2024/05/26/autocomplete_with_nvim-cmp/
-- https://github.com/goolord/collaborators.vim/commit/997df30c5a58643ff1aa18dc4b20f72af20f02be

local function list_collaborators()
  return vim.fn.systemlist("git log | grep 'Author:' | sort | uniq | cut -c 9-")
end

local collaborators_cache = list_collaborators()

local git_authors_source = {}

function git_authors_source:complete(params, callback)
  local items = {}

  local cursor_before_line = params.context.cursor_before_line

  if cursor_before_line:sub(-1) == "@" then
    for _, collaborator in ipairs(collaborators_cache) do
      table.insert(items, {
        label = collaborator,
        textEdit = {
          newText = collaborator,
          range = {
            start = {
              line = params.context.cursor.row - 1,
              character = params.context.cursor.col - 2,
            },
            ["end"] = {
              line = params.context.cursor.row - 1,
              character = params.context.cursor.col - 1,
            },
          },
        },
      })
    end
  end

  callback(items)
end

function git_authors_source:get_trigger_characters()
  return { "@" }
end

local cmp = require("cmp")

cmp.register_source("git_authors", git_authors_source)

cmp.setup.buffer({
  sources = vim.tbl_deep_extend(
    'force',
    cmp.get_config().sources,
    { { name = "git_authors" } }
  )
})
