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
  p.isVisible = true
  pt.isVisible = true
  local options = {effect ='crossFade', time = 400}
  composer.gotoScene(goto, options)
end

local function setUpDisplay(grp)
  --BASIC settings
  local bg = display.newImageRect(grp, 'img/landscape.png', 1400, 1920)
  bg.x = display.contentCenterX+10; bg.y = display.contentCenterY;

  local Pers = display.newImageRect(grp, 'img/player2.png', 230, 300)
  Pers.x = 300; Pers.y = 1400
  --ORC
  local Orc = display.newImageRect(grp, 'img/orc.png', 270, 300)
  Orc.x = 700; Orc.y = 1400

  --Main menu button1
  newButton = widget.newButton {
        shape = 'roundedRect', cornerRadius = 40,
        width = 400, height = 120,
        left = 30, top = 150,

        fillColor = { default={249/255,243/255, 245/255, 0},over={150/255,0.3}},
        labelColor = {default={25/255,120/255,255/255}, over={1}},
        label = 'Новая игра',
        fontSize = 60, labelAlign = center,
        id="scenes.Play",
        onRelease=goSomewhere,
  }
  grp:insert(newButton)


  -------------------------------
    --WELCOMER!!!
    local elGroup = display.newGroup()
    -- Create a native text box
    if (showText == true) then
      textBox = native.newTextBox(display.contentCenterX+25, display.contentCenterY+25, 900, 1500 )
       textBox:setTextColor( 25/255,120/255,215/255 )
       textBox.text = "Welcome to the awesome, short journey! The knight templar must save his friend Rudrig. He is dying from severe wounds. Knight need to rich the sacred spring, the waters of which have a truly healing power, according to beliefs. But he is in the lands of the orcs, so he must overcome all the dangers and cope with this difficult task.  "
      -- Change the text box's size property
        showText = false
        textBox.size = 60; elGroup:insert(textBox)
        --textBox.hasBackground = false



    PressMe = widget.newButton {
          shape = 'roundedRect', cornerRadius = 40,
          width = 700, height = 175,
          left = 200, top = 70,

          fillColor = { default={249/255,243/255, 245/255},over={150/255,0.3}},
          labelColor = {default={25/255,120/255,255/255}, over={1}},
          label = 'Закрыть описание',
          fontSize = 60, labelAlign = center,


          onPress = function(event)
            elGroup:removeSelf()

          end,
    }
    elGroup:insert(PressMe)

    --Adding
    -----------------------
    grp:insert(elGroup)

    end
  end


-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
    print("menu scene:create")
    ostSnd = audio.loadSound('snd/little_epic_journey.ogg', mainSndOptions)
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
          p.isVisible = false
          pt.isVisible = false
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
    p.isVisible = false


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
