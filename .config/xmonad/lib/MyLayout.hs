module MyLayout where

import XMonad

import XMonad.Layout
import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing
import XMonad.Hooks.ManageDocks

myLayout = avoidStruts $ tiled ||| Mirror tiled ||| noBorders Full
  where
    tiled   = spacingWithEdge 5 $ Tall nmaster delta ratio
    nmaster = 1      -- Default number of windows in the master pane
    ratio   = 1/2    -- Default proportion of screen occupied by master pane
    delta   = 3/100  -- Percent of screen to increment by when resizing panes

