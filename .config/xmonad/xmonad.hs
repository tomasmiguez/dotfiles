import XMonad

import XMonad.Actions.FindEmptyWorkspace
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
    , normalBorderColor  = "#6297a2"
    , focusedBorderColor = "#46d9ff"
    }
    `additionalKeysP`
    [ ("M-m",       viewEmptyWorkspace)
    , ("M-S-m",     tagToEmptyWorkspace)

    , ("M-b",       sendMessage ToggleStruts)

    , ("M-<Print>", spawn "flameshot gui")
    ]
