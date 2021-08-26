# Copy this to ~/.config/skippy-xd/skippy-xd.rc and edit it to your liking
#
# Notes:
#
# - colors can be anything XAllocNamedColor can handle
#   (like "black" or "#000000")
#
# - distance is a relative number, and is scaled according to the scale
#   factor applied to windows
#
# - fonts are Xft font descriptions
#
# - booleans are "true" or anything but "true" (-> false)
#
# - opacity is an integer in the range of 0-255
#
# - brighness is a floating point number (with 0.0 as neutral)
#
# - if the update frequency is a negative value, the mini-windows will only
#   be updated when they're explicitly rendered (like, when they gain or
#   lose focus). otherwise updateFreq is how many updates per second (fps)
#
# - the 'shadowText' option can be a color or 'none', in which case the
#   drop-shadow effect is disabled
#
# - Picture specification:
#   [WIDTHxHEIGHT] [orig|scale|scalek|tile] [left|mid|right] [left|mid|right]
#   [COLOR|#FFFFFFFF] [PATH]
#
#   Examples:
#   background = 500x400 tile right mid #FF0000 /home/richard/screenshots/256.png
#   background = orig mid mid #FF000080
#
# - [bindings] for miwMouse[1,2,3] can bind to "no" (do nothing), "focus"
#   (focus to window), "iconify", "shade-ewmh" (toggle window shade state),
#   "close-icccm" (close window with ICCCM method), "close-ewmh" (close
#   window with EWMH method), or "destroy" (forcefully destroy the window).
#
# - [bindings] key* = is a list of valid XWindows KeySym identifiers, case
#   sensitive and <space> seperated list. Run the program 'xev' to find them.
#
# - [bindings] modifierKeyMasks* = is a list of valid XWindows modifier key
#   bitmask identifiers, as defined in the /usr/include/X11/X.h header file.
#

[general]
distance = 50
useNetWMFullscreen = true
ignoreSkipTaskbar = true
updateFreq = 60.0
lazyTrans = false
pipePath = /tmp/skippy-xd-fifo
movePointerOnStart = true
movePointerOnSelect = true
movePointerOnRaise = true
switchDesktopOnActivate = false
useNameWindowPixmap = false
forceNameWindowPixmap = false
includeFrame = true
allowUpscale = true
showAllDesktops = true
showUnmapped = true
preferredIconSize = 48
clientDisplayModes = thumbnail-icon thumbnail icon filled none
iconFillSpec = orig mid mid #00FFFF
fillSpec = orig mid mid #FFFFFF
background =

[xinerama]
showAll = true

[normal]
tint = black
tintOpacity = 0
opacity = 200

[highlight]
tint = #101020
tintOpacity = 64
opacity = 255

[tooltip]
show = true
followsMouse = true
offsetX = 20
offsetY = 20
align = left
border = #ffffff
background = #404040
opacity = 128
text = #ffffff
textShadow = black
font = fixed-11:weight=bold

[bindings]
miwMouse1 = focus
miwMouse2 = close-ewmh
miwMouse3 = iconify
keysUp = Up w
keysDown = Down s
keysLeft = Left b a
keysRight = Right Tab f d
keysExitCancelOnPress = Escape BackSpace x q
keysExitCancelOnRelease =
keysExitSelectOnPress = Return space
keysExitSelectOnRelease = Super_L Super_R Alt_L Alt_R ISO_Level3_Shift
keysReverseDirection = Tab
modifierKeyMasksReverseDirection = ShiftMask ControlMask
