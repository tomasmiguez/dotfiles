import XMonad

import XMonad.Actions.FindEmptyWorkspace
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.StatusBar
import XMonad.Util.EZConfig
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.WindowSwallowing
import qualified XMonad.Util.Hacks as Hacks

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
    , handleEventHook    = swallowEventHook (className =? "Alacritty") (return True)
                         <+> Hacks.windowedFullscreenFixEventHook
    , normalBorderColor  = "#6297a2"
    , focusedBorderColor = "#46d9ff"
    }
    `additionalKeysP`
    [ ("M-m",       viewEmptyWorkspace)
    , ("M-S-m",     tagToEmptyWorkspace)

    , ("M-b",       sendMessage ToggleStruts)

    , ("M-<Print>", spawn "flameshot gui")

    , ("M-f", spawn "~/scripts/dmenu-open-project-nvim")
    ]
