return {
  s(
    { trig="\\db", snippetType="autosnippet" },
    { t("require 'debug'; debugger"), }
  ),
  s(
    { trig="\\si", snippetType="autosnippet" },
    fmta(
      "\"<>#{<>}<>\"",
      { i(1), i(2), i(3) }
    )
  )
}
