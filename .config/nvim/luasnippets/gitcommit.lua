-- https://archive.kernel.org/oldwiki/git.wiki.kernel.org/index.php/CommitMessageConventions.html
-- https://ejmastnak.com/tutorials/vim-latex/luasnip/#hello-world
return {
  s(
    { trig="trb", dscr="Trailer reported by" },
    { t("Reported-By: ") }
  ),
  s(
    { trig="tcab", dscr="Trailer co-authored by" },
    { t("Co-Authored-By: ") }
  ),
  s(
    { trig="tsb", dscr="Trailer suggested by" },
    { t("Suggested-By: ") }
  ),
  s(
    { trig="tc", dscr="Trailer closes" },
    { t("Closes: ") }
  )
}
