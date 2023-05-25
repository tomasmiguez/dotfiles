module MyXmobar where

import XMonad.Hooks.StatusBar.PP
import XMonad.Util.Loggers

import qualified MyColors

myXmobarPP :: PP
myXmobarPP = def
    { ppSep             = white " | "
    , ppTitleSanitize   = xmobarStrip
    , ppCurrent         = wrap " " "" . xmobarBorder "Top" MyColors.cyan 2
    , ppVisible         = wrap " " "" . xmobarBorder "Top" MyColors.darkCyan 2
    , ppHidden          = white . wrap " " ""
    , ppHiddenNoWindows = lowWhite . wrap " " ""
    , ppUrgent          = red . wrap (yellow "!") (yellow "!")
    , ppOrder           = \[ws, _, _, wins] -> [ws, "", wins]
    , ppExtras          = [logTitles formatFocused formatUnfocused]
    }
  where
    formatFocused   = wrap (white "[") (white "]") . pink   . ppWindow
    formatUnfocused = wrap (white "[") (white "]") . purple . ppWindow

    -- | Windows should have *some* title, which should not not exceed a
    -- sane length.
    ppWindow :: String -> String
    ppWindow = xmobarRaw . (\w -> if null w then "untitled" else w) . shorten 30

    purple, gray, pink, red, white, yellow :: String -> String
    pink     = xmobarColor MyColors.pink   ""
    purple   = xmobarColor MyColors.purple ""
    white    = xmobarColor MyColors.white  ""
    yellow   = xmobarColor MyColors.yellow ""
    red      = xmobarColor MyColors.red    ""
    gray     = xmobarColor MyColors.gray   ""

