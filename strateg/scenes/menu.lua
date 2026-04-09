local composer = require('composer')
local widget = require('widget')
local physics = require('physics')
widget.setTheme('widget\_theme\_ios')


local scene = composer.newScene()
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
local mainSndOptions =
{
channel = 1,
loops = -1,
}
audio.setVolume( 0.9, {channel=1} )
--audio.getMaxVolume( { channel=1 } )
local ostSnd



--functions
local function goSomewhere(event)
  local goto = event.target.id
  composer.removeScene('scenes.menu', false)
end

local function setUpDisplay(grp)
  --BASIC settings
  local bg = display.newImageRect(grp, 'img/menuBG2.jpg', 2000, 1300)
  bg.x = display.contentCenterX+10; bg.y = display.contentCenterY;

  local titleBG = display.newRect(grp, 950, 150, 580, 105)
  titleBG:setFillColor(230/255)
  local title = display.newText(grp, 'Типа Герои', 950, 150, native.system, 70)
  title:setFillColor(182/255,105/255,43/255)

  local Pers = display.newImageRect(grp, 'img/hero.png', 200, 330)
  Pers.x = 1300; Pers.y = 180
  --ORC
  local Orc = display.newImageRect(grp, 'img/sputnik.png', 240, 260)
  Orc.x = 1650; Orc.y = 180
  --ORC
  local Orc2 = display.newImageRect(grp, 'img/boss.png', 260, 320)
  Orc2.x = 250; Orc2.y = 180
  Orc2:scale(-1,1)
  --ORC
  local Orc3 = display.newImageRect(grp, 'img/enemy.png', 240, 270)
  Orc3.x = 550; Orc3.y = 180
  Orc3:scale(-1,1)
  --ORC
  local Orc4 = display.newImageRect(grp, 'img/enemy2.png', 200, 280)
  Orc4.x = 650; Orc4.y = 300
  Orc4:scale(-1,1)



  --Main menu button1
  newButton = widget.newButton {
        shape = 'roundedRect', cornerRadius = 40,
        width = 400, height = 120,
        left = 140, top = 340,

        fillColor = { default={249/255,243/255, 245/255, 0.8},over={150/255,0.3}},
        labelColor = {default={25/255,120/255,255/255}, over={1}},
        label = 'Начать игру',
        fontSize = 60, labelAlign = center,
        id="scenes.Play",
        onRelease=goSomewhere,
  }
  grp:insert(newButton)


  end


-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
    print("menu scene:create")
    ostSnd = audio.loadSound('snd/DIRT.mp3', mainSndOptions)
    setUpDisplay(sceneGroup)



end--ENDING CREATING


-- show()
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
        print('menu scene:show will')


    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
          print('menu scene:show did')
          audio.play(ostSnd, mainSndOptions)

    end


end


-- hide()
function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
        print("menu scene: hide: will")



    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
        print("menu scene: hide: did")
        composer.removeScene('scenes.menu', false)
    end
end


-- destroy()
function scene:destroy( event )

    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view
    print('menu scene: destroy')
    audio.stop()
    audio.dispose( ostSnd)
    ostSnd = nil
    local options = {effect ='crossFade', time = 400}
    composer.gotoScene('scenes.Play', options)

end


-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene
