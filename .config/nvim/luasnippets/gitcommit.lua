-- https://archive.kernel.org/oldwiki/git.wiki.kernel.org/index.php/CommitMessageConventions.html
-- https://ejmastnak.com/tutorials/vim-latex/luasnip/#hello-world
return {
  s(
    { trig="reported", dscr="Trailer reported by" },
    { t("Reported-By: ") }
  ),
  s(
    { trig="coauthored", dscr="Trailer co-authored by" },
    { t("Co-Authored-By: ") }
  ),
  s(
    { trig="suggested", dscr="Trailer suggested by" },
    { t("Suggested-By: ") }
  ),
  s(
    { trig="closes", dscr="Trailer closes" },
    { t("Closes: ") }
  ),
  s(
    { trig="feat" },
    fmt(
      [[
      feat({}): {}

      {}
      ]],
      { i(1, "scope"), i(2, "title"), i(3, "body") }
    )
  ),
  s(
    { trig="fix" },
    fmt(
      [[
      fix({}): {}

      {}
      ]],
      { i(1, "scope"), i(2, "title"), i(3, "body") }
    )
  ),
  s(
    { trig="chore" },
    fmt(
      [[
      chore({}): {}

      {}
      ]],
      { i(1, "scope"), i(2, "title"), i(3, "body") }
    )
  ),
  s(
    { trig="refactor" },
    fmt(
      [[
      refactor({}): {}

      {}
      ]],
      { i(1, "scope"), i(2, "title"), i(3, "body") }
    )
  ),
}
