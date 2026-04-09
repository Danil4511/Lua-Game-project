



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
local adSnd
local mainSndOptions ={
  channel = 1,
  loops = -1,
  fadein = 5000, }
audio.setVolume( 0.8, {channel=1} )
local adSndOptions ={
  channel = 2 }
audio.setVolume( 0.5 , {channel = 2})
audio.setVolume( 0.5 , {channel = 3})
audio.setVolume( 0.5 , {channel = 4})



--audio.getMaxVolume( { channel=1 } )



--RENDERING OBJECTS
local bg1
local bg2
local bg3
local bg4
local bg5

------------------------

--CLOSE GAME
local function stopListener()
  Runtime:removeEventListener("enterFrame", onUpdate)
  bg1:removeEventListener('tap', movePers)
  bg2:removeEventListener('tap', movePers)
  bg3:removeEventListener('tap', movePers)
  bg4:removeEventListener('tap', movePers)
  bg5:removeEventListener('tap', movePers)
end

--STOP PHYSICS Aother
local function stopPhysics()
  physics.stop()
end

--------------------------------
--PEREHOD
local function goSomewhere11(event)
  --STOP ALL------------


    --composer.showOverlay( goto )

  stopPhysics()
  stopListener()


  --p.isVisible = true
  pt.isVisible = true
  local options = {effect ='crossFade', time = 400}
  composer.removeScene('scenes.Play', false)
  composer.gotoScene('scenes.menu')

end
--PEREHOD
local function goSomewhere(event)
  --STOP ALL------------


    --composer.showOverlay( goto )

  stopPhysics()
  stopListener()

  local goto = event.target.id
  --p.isVisible = true
  pt.isVisible = true
  local options = {effect ='crossFade', time = 400}
  composer.removeScene('scenes.Play', false)
  composer.gotoScene(goto)

end

--PEREHOD
local function goSomeWhere(event)
  --STOP ALL------------

  --[[  ]]

  --p.isVisible = true
  --pt.isVisible = true
  audio.stop()


  composer.showOverlay('scenes.fight', {
    isModal = true,
    effect = 'fromTop',
    time = 400,
  })
    --composer.gotoScene('scenes.fight')
end

------БОСССС
local function goSomeWhere2(event)
  --STOP ALL------------

  --[[  ]]

  --p.isVisible = true
  --pt.isVisible = true
  audio.stop()


  composer.showOverlay('scenes.fightBoss', {
    isModal = true,
    effect = 'fromTop',
    time = 400,
  })
    --composer.gotoScene('scenes.fight')
end


--PEREHOD------------------------------------------------------
local function OrcDialog1(event)
  --STOP ALL------------




  --local f = display.newRect(d_X, d_Y, 1080, 1920)
  --f:setFillColor(123/255, 212/255, 111/255)
  --p.isVisible = true
  --local ft = display.newText(event, d_X, d_Y, native.system, 80)
  --ft:setFillColor(200/255, 10/255, 120/255)
  --local rt = display.newText('Начать диалог', d_X, d_Y+200, native.system, 80)
  local function retry()
    --f:removeSelf()
    ft:removeSelf()
    rt:removeEventListener('tap', retry)
    rt:removeSelf()
    bg1:removeEventListener('tap', movePers)
    bg2:removeEventListener('tap', movePers)
    composer.removeScene('scenes.Play', false)
    --p.isVisible = true
    --composer.removeScene('scenes.nPlay', false)
    --composer.gotoScene('scenes.nMenu')
  end
  --rt:addEventListener('tap', retry)
  --p.isVisible = true

    local bagc = display.newRect(display.contentCenterX,
          display.contentCenterY, display.contentWidth,
          display.contentHeight+420)
    bagc:setFillColor(250/255)
  ----------------------
      -- Create a native text box
      local textBox = native.newTextBox(display.contentCenterX-30, 500,1000, 500 )

      textBox:setTextColor( 25/255,120/255,215/255 )
      textBox.hasBackground = false
      textBox.text = "Ахахах, кого я вижу, одинокий рыцарь))\nЧе те надо на землях орков? Мы здесь не жалуем людей"
      -- Change the text box's size property
      textBox.size = 60
  --------------------------
  newButtonFight = widget.newButton {
        shape = 'roundedRect', cornerRadius = 40,
        width = 400, height = 80,
        left = 0, top = 20,

        fillColor = { default={249/255,243/255, 245/255, 0},over={150/255,0.3}},
        labelColor = {default={175/255,140/255,43/255}, over={1}},
        label = 'Начать бой',
        fontSize = 60, labelAlign = center,
        id="scenes.fight",
        onRelease=function(event)
          newButtonDialog:removeSelf()
          newButtonFight:removeSelf()
          textBox:removeSelf()
          bagc:removeSelf()
          Orc:removeEventListener('collision', Orc)
          Orc:removeSelf()
          goSomeWhere()
          end,
  }

   newButtonDialog = widget.newButton {
        shape = 'roundedRect', cornerRadius = 40,
        width = 400, height = 80,
        left = 40, top = 800,

        fillColor = { default={249/255,243/255, 245/255, 0},over={150/255,0.3}},
        labelColor = {default={175/255,140/255,43/255}, over={1}},
        label = 'Приветсвую зеленокожий. Мне нужно \nлишь добраться до чёрного источника.\nДоставлять какие-либо неудобства \nя не собираюсь',
        fontSize = 50, labelAlign = center,
        onRelease=function(event)
          textBox.text = 'Мы не любим, когда на нашу землю приходят чужаки. А ещё больше не любим, когда кто то хочет осквернить своим человеческим присутствием наш священный источник. Уходи, пока я добрый,а иначе останешься здесь навсегда.'
          dil1()
        end,
  }

  function dil1()
      newButtonDialog:removeSelf()
      newButtonDialog = widget.newButton {
            shape = 'roundedRect', cornerRadius = 40,
            width = 400, height = 80,
            left = 40, top = 800,

            fillColor = { default={249/255,243/255, 245/255, 0},over={150/255,0.3}},
            labelColor = {default={175/255,140/255,43/255}, over={1}},
            label = 'Орк, дай мне пройти. Мне нужно \nлишь набрать немного воды.\nМой друг умирает в лагере.\nА ваш источник известен целитель-\nными свойствами',
            fontSize = 50, labelAlign = center,
            id="scenes.menu",
            onRelease=function(event)
              textBox.text = 'Ты пойми человечишка, если даже я тебя пропущу и ты пойдешь дальше, то тебя просто разорвут мои братья на куски. '
              dil2()
            end,  }
    end

     function dil2()
      newButtonDialog:removeSelf()
      newButtonDialog = widget.newButton {
            shape = 'roundedRect', cornerRadius = 40,
            width = 400, height = 80,
            left = 40, top = 800,

            fillColor = { default={249/255,243/255, 245/255, 0},over={150/255,0.3}},
            labelColor = {default={175/255,140/255,43/255}, over={1}},
            label = 'И всё же, у меня нет выбора.\nЯ должен найти лекарство для Рюдрига',
            fontSize = 50, labelAlign = center,
            id="scenes.menu",
            onRelease=function(event)
              textBox.text = 'Хмм. Хорошо, я пропущу тебя, но ты поделишься золотом, которое добудешь на своем пути. Все таки ты не сделал ничего плохого нашему народу. Проходи и сделай одолжение, не попадайся моим родичам на глаза'
              newButtonFight:removeSelf()
              dil3()
            end,  }
    end

    function dil3()
      newButtonDialog:removeSelf()
      newButtonDialog = widget.newButton {
            shape = 'roundedRect', cornerRadius = 40,
            width = 400, height = 80,
            left = 40, top = 800,

            fillColor = { default={249/255,243/255, 245/255, 0},over={150/255,0.3}},
            labelColor = {default={175/255,140/255,43/255}, over={1}},
            label = 'Благодарю, конечно, половина добытого золота будет твоей. Я этого не забуду, прощай.(уйти)',
            fontSize = 50, labelAlign = center,
            id="scenes.menu",
            onRelease=function(event)
              newButtonFight:removeSelf()
              newButtonDialog:removeSelf()
              textBox:removeSelf()
              bagc:removeSelf()
              Orc:removeEventListener('collision', Orc)
              Orc:removeSelf()
            end,  }
        end

end---END OF DIALOG 1

local function OrcDialog2()

  local bagc = display.newRect(display.contentCenterX,
        display.contentCenterY, display.contentWidth,
        display.contentHeight+420)
  bagc:setFillColor(250/255)
----------------------
    -- Create a native text box
    local textBox = native.newTextBox(display.contentCenterX-30, 500,1000, 500 )

    textBox:setTextColor( 25/255,120/255,215/255 )
    textBox.hasBackground = false
    textBox.text = "Уаррргх, кто это здесь?) Похоже бедненький рыцарь, который скоро останется не только без своего кошелька, но и без головы!"
    -- Change the text box's size property
    textBox.size = 60
--------------------------
  newButtonFight = widget.newButton {
      shape = 'roundedRect', cornerRadius = 40,
      width = 400, height = 80,
      left = 0, top = 20,

      fillColor = { default={249/255,243/255, 245/255, 0},over={150/255,0.3}},
      labelColor = {default={175/255,140/255,43/255}, over={1}},
      label = 'Начать бой!',
      fontSize = 60, labelAlign = center,
      id="scenes.fight",
      onRelease=function()
        newButtonFight:removeSelf()
        textBox:removeSelf()
        bagc:removeSelf()
        Orc2:removeEventListener('collision', Orc2)
        Orc2:removeSelf()
        goSomeWhere()
      end,
}


end--END OF DIALOG 2


local function OrcDialog3()

  local bagc = display.newRect(display.contentCenterX,
        display.contentCenterY, display.contentWidth,
        display.contentHeight+420)
  bagc:setFillColor(250/255)
----------------------
    -- Create a native text box
    local textBox = native.newTextBox(display.contentCenterX-30, 500,1000, 500 )

    textBox:setTextColor( 25/255,120/255,215/255 )
    textBox.hasBackground = false
    textBox.text = "Что? Как ты сюда добрался человек!?"
    -- Change the text box's size property
    textBox.size = 60
--------------------------
newButtonFight = widget.newButton {
      shape = 'roundedRect', cornerRadius = 40,
      width = 400, height = 80,
      left = 0, top = 20,

      fillColor = { default={249/255,243/255, 245/255, 0},over={150/255,0.3}},
      labelColor = {default={175/255,140/255,43/255}, over={1}},
      label = 'Начать битву',
      fontSize = 60, labelAlign = center,
      id="scenes.fight",
      onRelease=function()
        newButtonFight:removeSelf()
        newButtonDialog:removeSelf()
        textBox:removeSelf()
        bagc:removeSelf()
        Orc3:removeEventListener('collision', Orc3)
        Orc3:removeSelf()
        goSomeWhere2()
      end,
}

newButtonDialog = widget.newButton {
     shape = 'roundedRect', cornerRadius = 40,
     width = 400, height = 80,
     left = 40, top = 800,

     fillColor = { default={249/255,243/255, 245/255, 0},over={150/255,0.3}},
     labelColor = {default={175/255,140/255,43/255}, over={1}},
     label = 'Я прошел по твоим землям по тропе с юго-\nвостока. Мне нужно лишь немного воды,\nОрк, из черного источника, \nчтобы исцелить своего друга',
     fontSize = 50, labelAlign = center,
     onRelease=function(event)
       textBox.text = 'Значит нужно воды... Ах, как жаль, что ты её не получишь, а ещё, что ты сейчас подохнешь'
     end,
}

end--END OF DIALOG 3



 local function OrcDialog5()

  local bagc = display.newRect(display.contentCenterX,
        display.contentCenterY, display.contentWidth,
        display.contentHeight+420)
  bagc:setFillColor(250/255)
----------------------
    -- Create a native text box
    local textBox = native.newTextBox(display.contentCenterX-30, 500,1000, 500 )

    textBox:setTextColor( 25/255,120/255,215/255 )
    textBox.hasBackground = false
    textBox.text = "Вы дошли до своей цели - чёрного озера и тем самым спасли жизнь своему другу Рюдригу. Вам встретилось много опасностей, но вы, как и положено смелым, те кто готов идти до конца, не смотря на невзгоды, которые их ждут, преодолели земли кровожадных орков. Мне кажется эта наша вражда между народами напрасна, так как первый орк, которого я встретил, был не агрессивно настроен. Жаль, что остальные посчитали меня угрозой..."
    -- Change the text box's size property
    textBox.size = 60
--------------------------
newButtonFight = widget.newButton {
      shape = 'roundedRect', cornerRadius = 40,
      width = 400, height = 80,
      left = 0, top = 20,

      fillColor = { default={249/255,243/255, 245/255, 0},over={150/255,0.3}},
      labelColor = {default={175/255,140/255,43/255}, over={1}},
      label = 'Главное меню',
      fontSize = 60, labelAlign = center,
      id="scenes.menu",
      onRelease=function()
        newButtonFight:removeSelf()
        textBox:removeSelf()
        bagc:removeSelf()
        PRIZ:removeEventListener('collision', PRIZ)
        PRIZ:removeSelf()
        goSomewhere11()
      end,
}



end--END OF DIALOG 4


--BUTTON MENU
local function createPlayScreen(grp)
  --Main menu button
  newButton = widget.newButton {
        shape = 'roundedRect', cornerRadius = 40,
        width = 400, height = 80,
        left = 0, top = 20,

        fillColor = { default={249/255,243/255, 245/255, 0},over={150/255,0.3}},
        labelColor = {default={25/255,120/255,255/255}, over={1}},
        label = 'Меню',
        fontSize = 60, labelAlign = center,
        id="scenes.menu",
        onRelease=goSomewhere,
  }
  grp:insert(newButton)

  --Main menu button---------------------------------------------------------------
  newButton = widget.newButton {
        shape = 'roundedRect', cornerRadius = 40,
        width = 400, height = 80,
        left = 0, top = 180,

        fillColor = { default={249/255,243/255, 245/255, 0},over={150/255,0.3}},
        labelColor = {default={25/255,120/255,255/255}, over={1}},
        label = 'Запустить музыку',
        fontSize = 60, labelAlign = center,
        id="scenes.menu",
        onRelease=function(event)
          audio.play(adSnd, mainSndOptions)
        end,
  }
  grp:insert(newButton)
end--END OF MAIN FUNCTION



-------------------
--characters
local function chars(grp)
  -------------------------------
  physics.start()



  bg1 = display.newRect( grp, display.contentCenterX+320, display.contentCenterY+900, 440, 160)
  bg1:setFillColor(1,1,1,0.1)
  --
  bg2 = display.newRect( grp, display.contentCenterX+150, display.contentCenterY+650, 520, 340)
  bg2:setFillColor(100/255,200/255,100/255,0.1)
  --
  bg3 = display.newRect( grp, display.contentCenterX+350, display.contentCenterY+250, 350, 700)
  bg3:setFillColor(250/255,100/255,50/255,0.1)
   --
  bg4 = display.newRect( grp, display.contentCenterX+100, display.contentCenterY-200, 500, 340)
  bg4:setFillColor(100/255,100/255,250/255,0.1)
  --
  bg5 = display.newRect( grp, display.contentCenterX, display.contentCenterY-450, 300, 300)
  bg5:setFillColor(100/255,255/255,100/255,0.1)

local l = false
local l2 = false
local l3 = false


--Control our pers-------------------------
Pers = display.newImageRect(grp, 'img/player2.png', 100, 160)
Pers.x = 980; Pers.y = 1850
physics.addBody(Pers, 'dinamic'); Pers.gravityScale = 0;
Pers.ID = 'Pers'

 function movePers(event)
  local event_x  = event.x
  local event_y = event.y
  transition.moveTo(Pers, {x= event_x, y = event_y})
end
bg1:addEventListener('tap', movePers)
bg2:addEventListener('tap', movePers)



--------NPS
Orc = display.newImageRect(grp, 'img/orc.png', 150, 160)
Orc.x = 780; Orc.y = 1650;  Orc:scale(-1,1)
physics.addBody(Orc, 'dinamic'); Orc.gravityScale = 0;
Orc.ID = 'Orc'; Orc.isSensor = true

local function crush(self, event)
  if (event.phase== 'began' and event.other.ID == 'Pers') then
    bg1:removeEventListener('tap', movePers)
    l = true;
    OrcDialog1()
  end
end
Orc.collision = crush
Orc:addEventListener('collision', Orc)


Orc2 = display.newImageRect(grp, 'img/orc_zumbi.png', 145, 170)
Orc2.x = 950; Orc2.y = 1200;
physics.addBody(Orc2, 'dinamic'); Orc2.gravityScale = 0;
Orc2.ID = 'Orc2'; Orc2.isSensor = true

local function crush2(self, event)
  if (event.phase== 'began' and event.other.ID == 'Pers') then
    bg2:removeEventListener('tap', movePers)
    l2 = true;
    l3 = true;
    OrcDialog2()
  end
end
Orc2.collision = crush2
Orc2:addEventListener('collision', Orc2)


--------BOSS
Orc3 = display.newImageRect(grp, 'img/orc_hig.png', 170, 190)
Orc3.x = 550; Orc3.y = 550;
physics.addBody(Orc3, 'dinamic'); Orc3.gravityScale = 0;
Orc3.ID = 'Orc3'; Orc3.isSensor = true

local function crush3(self, event)
  if (event.phase== 'began' and event.other.ID == 'Pers') then
    bg3:removeEventListener('tap', movePers)
    OrcDialog3()
  end
end
Orc3.collision = crush3
Orc3:addEventListener('collision', Orc3)


PRIZ = display.newImageRect(grp, 'img/PRIZ.png', 95, 120)
PRIZ.x = 650; PRIZ.y = 420;
physics.addBody(PRIZ, 'dinamic'); PRIZ.gravityScale = 0;
PRIZ.ID = 'PRIZ'; PRIZ.isSensor = true

local function crush4(self, event)
  if (event.phase== 'began' and event.other.ID == 'Pers') then
    OrcDialog5()
  end
end
PRIZ.collision = crush4
PRIZ:addEventListener('collision', PRIZ)


----------------------------------
function onUpdate()
  if (l==true) then
    bg3:addEventListener('tap', movePers)
    l = false
  end
  if (l2==true) then
    bg4:addEventListener('tap', movePers)
    l2 = false
  end
  if (l3==true) then
    bg5:addEventListener('tap', movePers)
    l3 = false
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
    print("PLAY scene:create")
    bg = display.newImageRect(sceneGroup, 'img/sm.jpg', 1100, 1920)
    bg.x = display.contentCenterX; bg.y = display.contentCenterY;
    ostSnd = audio.loadSound('snd/DesolatePart2.mp3', mainSndOptions)
    adSnd = audio.loadSound('snd/whats_going_on.ogg', mainSndOptions)



    --RENDERING
    createPlayScreen(sceneGroup)

    HP= 25


end--ENDING CREATING


-- show()
function scene:show( event )
    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
        print('play scene:show will')


    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
          print('play scene:show did')
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
        print("play:hide: will")



    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
        print("play:hide: did")


    end
end


-- destroy()
function scene:destroy( event )

    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view
    print('PLAY: DESTORY')
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
