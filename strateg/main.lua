-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here


local composer = require('composer')
local widget = require('widget')

display.setStatusBar( display.HiddenStatusBar )

perh = display.newImageRect('img/dialog.jpg', 1920, 1200)
perh.x, perh.y = display.contentCenterX, display.contentCenterY

perh.isVisible = false





HP1 = 14
HP2 = 6

play = false

composer.gotoScene( 'scenes.menu' )
