import XMonad

import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.StatusBar
import XMonad.Util.EZConfig
import XMonad.Hooks.ManageDocks

import MyLayout
import MyXmobar

main :: IO ()
main = xmonad
     . ewmh
     . docks
     . dynamicEasySBs myBarSpawner
     $ myConfig

myConfig = def
    { modMask            = mod4Mask -- Super key
    , terminal           = "alacritty"
    , borderWidth        = 2
    , layoutHook         = myLayout
    }
