module MyXmobar where

import XMonad

import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Util.Loggers

import qualified MyColors

myBarSpawner :: ScreenId -> IO StatusBarConfig
myBarSpawner 0 = pure $ statusBarPropTo "_XMONAD_LOG_1" "xmobar -x 0 ~/.config/xmobar/xmobarrc_0" (pure myXmobarPP)
myBarSpawner 1 = pure $ statusBarPropTo "_XMONAD_LOG_2" "xmobar -x 1 ~/.config/xmobar/xmobarrc_1" (pure myXmobarPP)
myBarSpawner _ = mempty -- nothing on the rest of the screens

myXmobarPP :: PP
myXmobarPP = def
    { ppSep             = white " | "
    , ppTitleSanitize   = xmobarStrip
    , ppCurrent         = wrap " " "" . xmobarBorder "Top" MyColors.cyan 2
    , ppVisible         = wrap " " "" . xmobarBorder "Top" MyColors.darkCyan 2
    , ppHidden          = white . wrap " " ""
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

