
local composer = require('composer')


--bar
display.setStatusBar( display.HiddenStatusBar)

d_X, d_Y = display.contentCenterX, display.contentCenterY;


p = display.newRect(d_X, d_Y, 1080, 1920)
p:setFillColor(123/255, 212/255, 111/255)
pt = display.newText('Loading...', d_X, d_Y, native.system, 80)
pt.isVisible = false
p.isVisible = false

musChose = {'snd/mus/mainMenu.mp3','snd/mus/gameOver.ogg', 'snd/mus/leshy.ogg'}

showText = true


composer.gotoScene('scenes.nMenu')
