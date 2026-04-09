local composer = require('composer')


--bar
display.setStatusBar( display.HiddenStatusBar)

d_X, d_Y = display.contentCenterX, display.contentCenterY;


p = display.newRect(d_X, d_Y, 1080, 1920)
p:setFillColor(133/255, 70/255, 145/255)
pt = display.newText('Loading...', d_X, d_Y, native.system, 80)
pt.isVisible = false
p.isVisible = false


HP = 25


showText = true


composer.gotoScene('scenes.menu')
