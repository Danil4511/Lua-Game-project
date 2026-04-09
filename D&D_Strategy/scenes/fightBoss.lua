



local composer = require( "composer" )
local widget = require('widget')
local physics = require('physics')
widget.setTheme ( "widget\_theme\_ios" )


local scene = composer.newScene()
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
--BASIC settings
local ostSnd
local mainSndOptions ={
  channel = 1,
  loops = -1,
  fadein = 5000, }
audio.setVolume( 0.6, {channel=1} )
local adSndOptions ={
  channel = 2 }
audio.setVolume( 0.5 , {channel = 2})
audio.setVolume( 0.5 , {channel = 3})
audio.setVolume( 0.5 , {channel = 4})



--audio.getMaxVolume( { channel=1 } )



--RENDERING OBJECTS
local res1
local res2
local sc1
local sc2

------------------------

--CLOSE GAME
local function stopListener()
  Runtime:removeEventListener("enterFrame", onUpdate)

end


--------------------------------
local function goSomewhere(event)
  --STOP ALL------------

  --p.isVisible = true
  --pt.isVisible = true
  composer.hideOverlay( 'scenes.fightBoss' )
  composer.removeHidden( )

end


local function goSomeWhere(event)
  --STOP ALL------------

  composer.removeScene( 'scenes.fightBoss')
  composer.removeScene( 'scenes.Play')
  composer.gotoScene( 'scenes.Play')

end


local function Action(event)
  --STOP ALL------------
  stopListener()

  if (event=='Погибли') then
    textBox:removeSelf()
    local f = display.newRect(d_X, d_Y, 1080, 1920)
    f:setFillColor(123/255, 872/255, 231/255)
    local ft = display.newText(event, d_X, d_Y+200, native.system, 80)
    ft:setFillColor(200/255, 10/255, 120/255)
    local rt = display.newText('Вы', d_X, d_Y, native.system, 80)
    local function retry()
      f:removeSelf()
      ft:removeSelf()
      rt:removeEventListener('tap', retry)
      rt:removeSelf()
      newButtonM:removeSelf()
    end
    rt:addEventListener('tap', retry)
    --Main menu button
    newButtonM = widget.newButton {
          shape = 'roundedRect', cornerRadius = 40,
          width = 400, height = 80,
          left = 400, top = 20,

          fillColor = { default={249/255,243/255, 245/255, 0},over={150/255,0.3}},
          labelColor = {default={25/255,120/255,255/255}, over={1}},
          label = 'Начать с начала',
          fontSize = 60, labelAlign = center,
          id="scenes.Play",
          onRelease=function(event)
            f:removeSelf()
            ft:removeSelf()
            rt:removeEventListener('tap', retry)
            rt:removeSelf()
            newButtonM:removeSelf()
            goSomeWhere();
          end,
    }
  else
      textBox:removeSelf()
      local f = display.newRect(d_X, d_Y, 1080, 1920)
      f:setFillColor(123/255, 872/255, 231/255)
      local ft = display.newText(event, d_X, d_Y+200, native.system, 80)
      ft:setFillColor(200/255, 10/255, 120/255)
      local rt = display.newText('Вы', d_X, d_Y, native.system, 80)
      local function retry()
        f:removeSelf()
        ft:removeSelf()
        rt:removeEventListener('tap', retry)
        rt:removeSelf()
        newButtonM:removeSelf()
      end
      rt:addEventListener('tap', retry)


      --Main menu button
      newButtonM = widget.newButton {
            shape = 'roundedRect', cornerRadius = 40,
            width = 400, height = 80,
            left = 500, top = 20,

            fillColor = { default={249/255,243/255, 245/255, 0},over={150/255,0.3}},
            labelColor = {default={25/255,120/255,255/255}, over={1}},
            label = 'Карта',
            fontSize = 80, labelAlign = center,
            id="scenes.Play",
            onRelease=function(event)
              f:removeSelf()
              ft:removeSelf()
              rt:removeEventListener('tap', retry)
              rt:removeSelf()
              newButtonM:removeSelf()
              goSomewhere();
            end,
      }
    end



end---КОНЕЦ





local function roll()

  sc1 =   math.random(3, 6) +  math.random(3, 6)
  sc2 =   math.random(0, 6) +  math.random(0, 6)
  res1.text = sc1
  res2.text = sc2

  Pers1.HP = Pers1.HP - sc2
  Orc.HP = Orc.HP - sc1
  HPtextP.text = Pers1.HP
  HPtextO.text = Orc.HP


end ----------- END OF ROll

-------------------
--characters
local function chars(grp)
  -------------------------------

    -- Create a native text box
    textBox = native.newTextBox(display.contentCenterX, 300,1000, 500 )
    grp:insert(textBox)
    textBox:setTextColor( 25/255,120/255,215/255 )
    textBox.hasBackground = false
    -- Change the text box's size property
    textBox.size = 60


--CHARACTER ( HERO )
    Pers1 = display.newImageRect(grp, 'img/player2.png', 300, 370)
    Pers1.x = 280; Pers1.y = 1300
    Pers1.HP = HP;
    --
    HPrectP = display.newRect(grp, 280, 1550, 300, 100)
    HPrectP:setFillColor(200/255)
    --
    HPtextP = display.newText(grp, Pers1.HP, 300, 1550, native.system, 60)
    TextHPP  = display.newText(grp, 'HP:', 200, 1550, native.system, 60)
    HPtextP:setFillColor(201/255,31/255,31/255)
    TextHPP:setFillColor(241/255,31/255,31/255)

    --------NPS
    Orc = display.newImageRect(grp, 'img/orc_hig.png', 360, 380)
    Orc.x = 780; Orc.y = 1300;
    Orc.HP = 30;
    --
    HPrectO = display.newRect(grp, 800, 1550, 300, 100)
    HPrectO:setFillColor(200/255)
    --
    HPtextO = display.newText(grp, Orc.HP, 850, 1550, native.system, 60)
    TextHPO  = display.newText(grp, 'HP:', 750, 1550, native.system, 60)
    HPtextO:setFillColor(52/255, 153/255, 28/255)
    TextHPO:setFillColor(52/255, 203/255, 28/255)
--------------------------
local resRect = display.newRect(grp, 540, 750, 1000, 400)
resRect:setFillColor(78/255,182/255,170/255)

res1Text = display.newText(grp, "Нанесено урона\n тамплиером:", 270, 650, native.system, 60)
res1Text:setFillColor(86/255,71/255,97/255)
res2Text = display.newText(grp, "Нанесено урона\n орком:", 800, 650, native.system, 60)
res2Text:setFillColor(86/255,71/255,97/255)

sc1 = 0
sc2 = 0
res1 = display.newText(grp, sc1, 300, 840, native.system, 70)
res2 = display.newText(grp, sc2, 750, 840, native.system, 70)
--------


newButtonPick = widget.newButton {
      shape = 'roundedRect', cornerRadius = 40,
      width = 600, height = 100,
      left = 300, top = 1000,

      fillColor = { default={19/255,243/255, 245/255, 1},over={150/255,0.3}},
      labelColor = {default={255/255,140/255,43/255}, over={1}},
      label = 'Бросить кость',
      fontSize = 60, labelAlign = center,
      id="scenes.fight",
      onRelease=function()
        roll()
      end,
}
  grp:insert(newButtonPick)





----------------------------------UPDATE
function onUpdate()
  if  (Pers1.HP <= 0) then
      Action('Погибли')
  elseif (Orc.HP <= 0) then
    Action("Победили")
  end
end
Runtime:addEventListener("enterFrame", onUpdate)


---------------------------------
end--END OF CHARACTERS


-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
    finish = false
    print("FIGHT scene:create")
    bg = display.newImageRect(sceneGroup, 'img/fight2.jpg', 1100, 1920)
    bg.x = display.contentCenterX; bg.y = display.contentCenterY;
    ostSnd = audio.loadSound('snd/rejected.ogg', mainSndOptions)







end--ENDING CREATING


-- show()
function scene:show( event )
    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
        print('FIGHT scene:show will')


    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
          print('FIGHT scene:show did')
          p.isVisible = false
          pt.isVisible = false
          chars(sceneGroup)
          audio.play(ostSnd, mainSndOptions)
    end

end


-- hide()
function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
        print("FIGHT:hide: will")




    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
        print("FIGHT:hide: did")


    end
end


-- destroy()
function scene:destroy( event )

    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view
    print('FIGHT: DESTORY')
    sceneGroup:removeSelf()
    --composer.removeScene('scenes.nPlay', false)
    audio.stop()
    audio.dispose( ostSnd )
    ostSnd = nil



    --sceneGroup:removeSelf()




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
