import XMonad

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.StatusBar
import XMonad.Util.EZConfig

import MyXmobar

main :: IO ()
main = xmonad
     . ewmh
     . withEasySB (statusBarProp "xmobar" (pure myXmobarPP)) defToggleStrutsKey
     $ myConfig

myConfig = def
    { modMask = mod4Mask -- Super key
    , terminal = "alacritty"
    , borderWidth = 2
    }
