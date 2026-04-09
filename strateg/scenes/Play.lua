local composer = require('composer')
local widget = require('widget')
local physics = require('physics')
widget.setTheme('widget\_theme\_ios')


local scene = composer.newScene()
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

local sndMas = {}
local mainSndOptions =
{
channel = 1,

  loops = -1
}
audio.setVolume( 0.9, {channel=1} )
--audio.getMaxVolume( { channel=1 } )
local ostSnd1
local ostSnd2
local ostSnd3

local p




newBuutton = widget.newButton( {
  shape = 'roundedRect', cornerRaduis = 80,
  width = 500, height = 160, left = display.contentCenterX-250,
  top = display.contentCenterY+100,
  label = 'В меню', fontSize = 60,
  onPress = function()
    perh.isVisible = false;
    newBuutton:removeSelf()

      bg1:removeEventListener('touch',movePers)
      bg2:removeEventListener('touch',movePers)
      bg3:removeEventListener('touch',movePers)
      bg4:removeEventListener('touch',movePers)
      bg5:removeEventListener('touch',movePers)
      bg6:removeEventListener('touch',movePers)

      if Orc ~= nil then
        Orc:removeEventListener('collision', Orc)
      end
      if Orc2 ~= nil then
      Orc2:removeEventListener('collision', Orc2)
      end
      if Orc3 ~= nil then
        print('orc3')
      Orc3:removeEventListener('collision', Orc3)
      end
      if Orc4 ~= nil then
      Orc4:removeEventListener('collision', Orc4)
      end
      if Orc5 ~= nil then
      Orc5:removeEventListener('collision', Orc5)
      end
      if Orc6 ~= nil then
          Orc6:removeEventListener('collision', Orc6)
      end

      p = 1
      composer.removeScene('scenes.Play', false)

  end
} )
newBuutton.isVisible = false



local function stop()
  bg1:removeEventListener('touch',movePers)
  bg2:removeEventListener('touch',movePers)
  bg3:removeEventListener('touch',movePers)
  bg4:removeEventListener('touch',movePers)
  bg5:removeEventListener('touch',movePers)
  bg6:removeEventListener('touch',movePers)
  Orc:removeEventListener('collision', Orc)
  Orc2:removeEventListener('collision', Orc2)
  Orc3:removeEventListener('collision', Orc3)
  Orc4:removeEventListener('collision', Orc4)
  Orc5:removeEventListener('collision', Orc5)
  Orc6:removeEventListener('collision', Orc6)
end


--functions
local function goSomewhere(event)


  p = 1
  composer.removeScene('scenes.Play', false)
end

--functions
local function goSomewhere2(event)
  bg1:removeEventListener('touch',movePers)
  bg2:removeEventListener('touch',movePers)
  bg3:removeEventListener('touch',movePers)
  bg4:removeEventListener('touch',movePers)
  bg5:removeEventListener('touch',movePers)
  bg6:removeEventListener('touch',movePers)
  Orc6:removeEventListener('collision', Orc6)

  p = 1
  composer.removeScene('scenes.Play', false)
end


local function goSomeWhere(event)
  audio.pause()
  --physics.stop()

  perh.isVisible = true

  composer.showOverlay('scenes.Battle', {
    isModal = true,
    effect = 'fromTop',
    time = 400,
  })
end

local function goSomeWhere2(event)
  audio.pause()
perh.isVisible = true

  composer.showOverlay('scenes.Battle01', {
    isModal = true,
    effect = 'fromTop',
    time = 400,
  })
end

local function goSomeWhere3(event)
  audio.pause()

  perh.isVisible = true
  composer.showOverlay('scenes.Battle21', {
    isModal = true,
    effect = 'fromTop',
    time = 400,
  })
end

local function goSomeWhere4(event)
  audio.pause()

  perh.isVisible = true
  composer.showOverlay('scenes.Battle2', {
    isModal = true,
    effect = 'fromTop',
    time = 400,
  })
end



  local function dialog1()
    -------------------------------
    --WELCOMER!!!

    local k = 0

      back = display.newImageRect('img/dialog.jpg', 1920, 1200)
      back.x, back.y = display.contentCenterX, display.contentCenterY


      textBox = native.newTextBox(display.contentCenterX+25, 300, 1700, 500 )
       textBox:setTextColor( 25/255,120/255,215/255 )
       textBox.text = "Ааа,эммм... Что делает тёмный монах на землях, захваченных нежитью? Ты меня не убьёшь!?"
      -- Change the text box's size property
        showText = false
        textBox.size = 60;
        --textBox.hasBackground = false


    PressMe = widget.newButton {
          shape = 'roundedRect', cornerRadius = 40,
          width = 300, height = 90,
          left = 600, top = 700,

          fillColor = { default={249/255,243/255, 245/255, 0},over={150/255,0.3}},
          labelColor = {default={25/255,120/255,255/255}, over={1}},
          label = 'Мне нужно пройти на северо-зааапад',
          fontSize = 50, labelAlign = center,


          onPress = function(event)
            if k == 0 then
              textBox.text = 'Тоо есть ты меня не собираешься уббивать?'
              PressMe:setLabel( "Не провоцируй меня, Гоблин!!!" )
              k = k + 1
            elseif k == 1 then
              textBox.text = 'Ладно, ладно. Так значит тебе нужно на северо-запад. \n Хмм. Ну так просто ты туда не попадешь, так как нежить недавно захватила замок Латка.'
              PressMe:setLabel( "Мне плевать на неё! Покажи мне обходной путь или самый простой,\nчтобы я не терял время на этих мертвяков" )
              k = k + 1
            elseif k == 2 then
              textBox.text = 'Я могу показать путь через замок, но придется его зачистить. Иначе нас расстреляют их арбалетчики!'
              PressMe:setLabel( "Я согласен, давай" )
              k = k + 1
            elseif k == 3 then
              textBox.text = 'Знааешь, мне тоже нужно на северо-запад, я застрял здесь, посреди леса и озера. А туда одному мне не добраться, сам понимаешь. НЕ возражаешь, если я пойду с тобой??'
              PressMe:setLabel( "Исключено!" )
              k = k + 1
            elseif k == 4 then
              textBox.text = 'Но тогда, Монах, ты потеряешь много времени плутая и выискивая тропинки. А я знаю эти леса довольно хорошо'
              PressMe:setLabel( "... При одном условии. Ты будешь молчать.\nЯ не люблю разговоры" )
              k = k + 1
            elseif k == 5 then
              textBox.text = 'Ладно, без проблем. Считай, что я давший обет монах, хахах'
              PressMe:setLabel( "Заткнись и веди!!" )
              k = k + 1
            elseif k == 6 then
              textBox:removeSelf()
              back:removeSelf()
              PressMe:removeSelf()
              Orc:removeEventListener('collision', Orc)
              Orc:removeSelf()
              Orc = nil
              bg2.isVisible = true
            end

          end,
    }

  end

  local function dialog2()
    -------------------------------
    --WELCOMER!!!

    local k = 0

      back = display.newImageRect('img/dialog.jpg', 1920, 1200)
      back.x, back.y = display.contentCenterX, display.contentCenterY


      textBox = native.newTextBox(display.contentCenterX+25, 300, 1700, 500 )
       textBox:setTextColor( 25/255,120/255,215/255 )
       textBox.text = "Кто это у нас здесь? Ооо, сбежавший пленник и свежее мясо для наших волколаков"
      -- Change the text box's size property
        showText = false
        textBox.size = 60;
        --textBox.hasBackground = false


    PressMe = widget.newButton {
          shape = 'roundedRect', cornerRadius = 40,
          width = 300, height = 90,
          left = 550, top = 700,

          fillColor = { default={249/255,243/255, 245/255, 0},over={150/255,0.3}},
          labelColor = {default={25/255,120/255,255/255}, over={1}},
          label = 'Пшел вон с дороги',
          fontSize = 50, labelAlign = center,


          onPress = function(event)
            if k == 0 then
              textBox.text = 'Сейчас ты заговоришь по другому'
              PressMe:setLabel( "Начать битву" )
              k = k + 1
            elseif k == 1 then
              textBox:removeSelf()
              back:removeSelf()
              PressMe:removeSelf()
              Orc2:removeEventListener('collision', Orc2)
              Orc2:removeSelf()
              Orc2 = nil
              play = true
              bg3.isVisible = true
              bg4.isVisible = true
              goSomeWhere()
            end

          end,
    }

  end



  local function dialog3()
    -------------------------------
    --WELCOMER!!!

    local k = 0

      back = display.newImageRect('img/dialog.jpg', 1920, 1200)
      back.x, back.y = display.contentCenterX, display.contentCenterY


      textBox = native.newTextBox(display.contentCenterX+25, 300, 1700, 500 )
       textBox:setTextColor( 25/255,120/255,215/255 )
       textBox.text = "Ввгхааарр.."
      -- Change the text box's size property
        showText = false
        textBox.size = 60;
        --textBox.hasBackground = false


    PressMe = widget.newButton {
          shape = 'roundedRect', cornerRadius = 40,
          width = 300, height = 90,
          left = 400, top = 700,

          fillColor = { default={249/255,243/255, 245/255, 0},over={150/255,0.3}},
          labelColor = {default={25/255,120/255,255/255}, over={1}},
          label = 'Похоже ты не настроен на разговор, ну что ж,\nтогда ты умрешь',
          fontSize = 50, labelAlign = center,


          onPress = function(event)
            if k == 0 then
              textBox:removeSelf()
              back:removeSelf()
              PressMe:removeSelf()
              Orc3:removeEventListener('collision', Orc3)
              Orc3:removeSelf()
              Orc3 = nil
              bg4.isVisible = true
              play = true
              goSomeWhere2()
            end
          end,
    }

  end


  local function dialog4()
    -------------------------------
    --WELCOMER!!!

    local k = 0

      back = display.newImageRect('img/dialog.jpg', 1920, 1200)
      back.x, back.y = display.contentCenterX, display.contentCenterY


      textBox = native.newTextBox(display.contentCenterX+25, 300, 1700, 500 )
       textBox:setTextColor( 25/255,120/255,215/255 )
       textBox.text = "Похоже ты забрел не туда, Монах. А еще похоже, что ты уничтожил наших сторожевых по пути сюда. Когда ты заходил на наши земли, ты правда думал, что это тебе сойдет с рук?"
      -- Change the text box's size property
        showText = false
        textBox.size = 60;
        --textBox.hasBackground = false


    PressMe = widget.newButton {
          shape = 'roundedRect', cornerRadius = 40,
          width = 300, height = 90,
          left = 400, top = 700,

          fillColor = { default={249/255,243/255, 245/255, 0},over={150/255,0.3}},
          labelColor = {default={25/255,120/255,255/255}, over={1}},
          label = 'Нет. Но я предполагал это, \nтак как ни один мертвец не способен меня остановить',
          fontSize = 50, labelAlign = center,


          onPress = function(event)
            if k == 0 then
              textBox.text='Хахха, возможно и нет. Но теперь нас несколько, посмотрим, как ты запоешь'
              PressMe:setLabel('Убить их')
              k = k+1
            elseif k==1 then
              textBox:removeSelf()
              back:removeSelf()
              PressMe:removeSelf()
              Orc4:removeEventListener('collision', Orc4)
              Orc4:removeSelf()
              Orc4 = nil
              bg5.isVisible = true
              play = true
              goSomeWhere3()
            end
          end,
    }

  end



  local function dialog5()
    -------------------------------
    --WELCOMER!!!

    local k = 0

      back = display.newImageRect('img/dialog.jpg', 1920, 1200)
      back.x, back.y = display.contentCenterX, display.contentCenterY


      textBox = native.newTextBox(display.contentCenterX+25, 300, 1700, 500 )
       textBox:setTextColor( 25/255,120/255,215/255 )
       textBox.text = "..."
      -- Change the text box's size property
        showText = false
        textBox.size = 60;
        --textBox.hasBackground = false


    PressMe = widget.newButton {
          shape = 'roundedRect', cornerRadius = 40,
          width = 300, height = 90,
          left = 400, top = 700,

          fillColor = { default={249/255,243/255, 245/255, 0},over={150/255,0.3}},
          labelColor = {default={25/255,120/255,255/255}, over={1}},
          label = 'Вряд ли они захотят с нами разговаривать',
          fontSize = 50, labelAlign = center,


          onPress = function(event)
            if k == 0 then
              textBox:removeSelf()
              back:removeSelf()
              PressMe:removeSelf()
              Orc5:removeEventListener('collision', Orc5)
              Orc5:removeSelf()
              Orc5 = nil
              bg6.isVisible = true
              play = true
              goSomeWhere4()
            end
          end,
    }

  end




  local function dialog6()
    -------------------------------
    --WELCOMER!!!

    local k = 0

      back = display.newImageRect('img/dialog.jpg', 1920, 1200)
      back.x, back.y = display.contentCenterX, display.contentCenterY


      textBox = native.newTextBox(display.contentCenterX+25, 300, 1700, 500 )
       textBox:setTextColor( 25/255,120/255,215/255 )
       textBox.text = "Вы добрались до перехода через этот замок. Да предстоит ещё долгий путь с вашим новым напарником - гоблином. Но на нем больше не встретиться нежити"
      -- Change the text box's size property
        showText = false
        textBox.size = 60;
        --textBox.hasBackground = false


    PressMe = widget.newButton {
          shape = 'roundedRect', cornerRadius = 40,
          width = 300, height = 90,
          left = 400, top = 700,

          fillColor = { default={249/255,243/255, 245/255, 0},over={150/255,0.3}},
          labelColor = {default={25/255,120/255,255/255}, over={1}},
          label = 'Выйти в меню',
          fontSize = 50, labelAlign = center,


          onPress = function(event)
            if k == 0 then
              textBox:removeSelf()
              back:removeSelf()
              PressMe:removeSelf()
              goSomewhere2()
            end
          end,
    }

  end

  ------------------------------



local function setUpDisplay(grp)
  HP1 = 14
  HP2 = 6


  physics.start()
  --BASIC settings
  local bg = display.newImageRect(grp, 'img/game.jpg', 2000, 1300)
  bg.x = display.contentCenterX+10; bg.y = display.contentCenterY;


-----------------------
back = display.newImageRect('img/dialog.jpg', 1920, 1200)
back.x, back.y = display.contentCenterX, display.contentCenterY

textBox = native.newTextBox(display.contentCenterX+25, 600, 1700, 800 )
 textBox:setTextColor( 25/255,120/255,215/255 )
 textBox.text = "Темный монах, он начал свой путь уже давно. После долгого путешествия, он почти добрался до своей цели, до горы Мауг, рядом с которой был когда-то возведён собор.\n\nЗачем ему туда нужно? Неизвестно. Кто его туда отправил? Неведомо. Об этом наша короткая история не рассказывает. А только показывает самую интересную часть пути нашего.., персонажа. Потому что героем темного монаха, который занимается изучением магии Дуру(нечистой, запрещенной), его сложно назвать. Но в то же время, он более лоялен ко всем существам,в отличии от ему подобных. Не против вступить в диалог и сказать, чтобы тот проваливал с его пути, пока его не избавили от мук Земных.\n\nВаш путь начинается с востока. Вы должны поочередно взаимодействовать со всеми тварями, которые вам встречаются, иначе вы не пройдете дальше."
-- Change the text box's size property
  showText = false
  textBox.size = 60;
  --textBox.hasBackground = false


PressMe = widget.newButton {
    shape = 'roundedRect', cornerRadius = 40,
    width = 300, height = 90,
    left = 1500, top = 50,

    fillColor = { default={249/255,243/255, 245/255, 0},over={150/255,0.3}},
    labelColor = {default={25/255,120/255,255/255}, over={1}},
    label = 'Закрыть',
    fontSize = 50, labelAlign = center,


    onPress = function(event)
        textBox:removeSelf()
        PressMe:removeSelf()
        back:removeSelf()
      end
}

----------------------



  bg1 = display.newRect(grp, 1750, 450, 550, 500)
  bg1:setFillColor(255/255,2/255,1/255,0.1)
  --
  bg2 = display.newRect(grp, 1250, 550, 650, 280)
  bg2:setFillColor(1/255,255/255,1/255,0.1)
  bg2.isVisible = false
  --
  bg3 = display.newRect(grp, 920, 850, 600, 450)
  bg3:setFillColor(1/255,255/255,255/255,0.1)
  bg3.isVisible = false
  bg4 = display.newRect(grp, 570, 800, 280, 240)
  bg4:setFillColor(200/255,255/255,255/255,0.1)
  bg4.isVisible = false
  bg5 = display.newRect(grp, 300, 700, 280, 240)
  bg5:setFillColor(200/255,255/255,255/255,0.1)
  bg5.isVisible = false
  bg6 = display.newRect(grp, 100, 700, 280, 300)
  bg6:setFillColor(200/255,1/255,255/255,0.1)
  bg6.isVisible = false


  Pers = display.newImageRect(grp, 'img/hero.png', 110, 155)
  Pers.x = 1850; Pers.y = 580
  physics.addBody(Pers, 'dinamic')
  Pers.gravityScale = 0
  Pers.ID = 'HERO'
  Pers.isSensor = true
  --ORC
  Orc = display.newImageRect(grp, 'img/sputnik.png', 190, 200)
  Orc.x = 1620; Orc.y = 300
  Orc:scale(-1,1)
  physics.addBody(Orc, 'dinamic')
  Orc.gravityScale = 0
  Orc.isSensor = false

  local function crushOrc(self, event)
    if (event.phase=='began' and event.other.ID == 'HERO') then
      print(1)
      dialog1()
    end
  end
  Orc.collision = crushOrc
  Orc:addEventListener('collision', Orc)


  function movePers(event)
    if event.phase == 'began' then
    local event_x = event.x
    local event_y = event.y
    transition.to(Pers, {x=event_x, y=event_y, time=800})
    end
  end
  bg1:addEventListener('touch',movePers)
  bg2:addEventListener('touch',movePers)
  bg3:addEventListener('touch',movePers)
  bg4:addEventListener('touch',movePers)
  bg5:addEventListener('touch',movePers)
  bg6:addEventListener('touch',movePers)



  --ORC
  Orc2 = display.newImageRect(grp, 'img/enemy.png', 180, 200)
  Orc2.x = 1300; Orc2.y = 550
  Orc2:scale(-1,1)
  physics.addBody(Orc2, 'dinamic')
  Orc2.gravityScale = 0
  Orc2.isSensor = true

  local function crushOrc2(self, event)
    if (event.phase=='began' and event.other.ID == 'HERO') then
      print(1)
      dialog2()
    end
  end
  Orc2.collision = crushOrc2
  Orc2:addEventListener('collision', Orc2)


  --ORC
  Orc3 = display.newImageRect(grp, 'img/enemy2.png', 140, 170)
  Orc3.x = 1100; Orc3.y = 1000
  physics.addBody(Orc3, 'dinamic')
  Orc3.gravityScale = 0
  Orc3.isSensor = true

  local function crushOrc3(self, event)
    if (event.phase=='began' and event.other.ID == 'HERO') then
      print(1)
      dialog3()
    end
  end
  Orc3.collision = crushOrc3
  Orc3:addEventListener('collision', Orc3)


  --ORC
  Orc4 = display.newImageRect(grp, 'img/enemy.png', 190, 230)
  Orc4.x = 500; Orc4.y = 740
  Orc4:scale(-1,1)
  physics.addBody(Orc4, 'dinamic')
  Orc4.gravityScale = 0
  Orc4.isSensor = true

  local function crushOrc4(self, event)
    if (event.phase=='began' and event.other.ID == 'HERO') then
      print(1)
      dialog4()
    end
  end
  Orc4.collision = crushOrc4
  Orc4:addEventListener('collision', Orc4)



  --ORC
  Orc5 = display.newImageRect(grp, 'img/boss.png', 155, 180)
  Orc5.x = 250; Orc5.y = 650
  Orc5:scale(-1,1)
  physics.addBody(Orc5, 'dinamic')
  Orc5.gravityScale = 0
  Orc5.isSensor = true

  local function crushOrc5(self, event)
    if (event.phase=='began' and event.other.ID == 'HERO') then
      print(1)
      dialog5()
    end
  end
  Orc5.collision = crushOrc5
  Orc5:addEventListener('collision', Orc5)


  --
  --ORC
  Orc6 = display.newImageRect(grp, 'img/exit.png', 120, 120)
  Orc6.x = 30; Orc6.y = 700
  Orc6:scale(-1,1)
  physics.addBody(Orc6, 'dinamic')
  Orc6.gravityScale = 0
  Orc6.isSensor = true

  local function crushOrc6(self, event)
    if (event.phase=='began' and event.other.ID == 'HERO') then
      print(1)
      dialog6()
    end
  end
  Orc6.collision = crushOrc6
  Orc6:addEventListener('collision', Orc6)



  --Main menu button1
  newButton = widget.newButton {
        shape = 'roundedRect', cornerRadius = 40,
        width = 400, height = 100,
        left = 40, top = 40,

        fillColor = { default={249/255,243/255, 245/255, 0.2},over={150/255,0.3}},
        labelColor = {default={255/255,120/255,175/255}, over={1}},
        label = 'Меню',
        fontSize = 60, labelAlign = center,
        id="scenes.Play",
        onRelease=goSomewhere2,
  }
  grp:insert(newButton)


  --Main menu button1
  newButton2 = widget.newButton {
        shape = 'roundedRect', cornerRadius = 40,
        width = 400, height = 100,
        left = 1500, top = 40,

        fillColor = { default={249/255,243/255, 245/255, 0},over={150/255,0.3}},
        labelColor = {default={225/255,200/255,175/255}, over={1}},
        label = 'Музыка',
        fontSize = 60, labelAlign = center,
        onRelease=function()
          audio.play(sndMas[math.random(1,3)], mainSndOptions)
        end,
  }
  grp:insert(newButton2)


  end


-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
    print("PLAY  scene:create")
    ostSnd1 = audio.loadSound('snd/AITheme0.mp3', mainSndOptions)
    ostSnd2 = audio.loadSound( 'snd/AITHEME1.mp3', mainSndOptions)
    ostSnd3 = audio.loadSound( 'snd/AITHEME2.mp3', mainSndOptions)
    sndMas = {ostSnd1, ostSnd2, ostSnd3}
    setUpDisplay(sceneGroup)



end--ENDING CREATING


-- show()
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
        print('PLAY scene:show will')


    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
          print('PLAY scene:show did')
          audio.play(sndMas[math.random(1,3)], mainSndOptions)

    end


end


-- hide()
function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
        print("PLAY  scene: hide: will")
        --composer.removeScene('scenes.Play', false)


    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
        print("PLAY  scene: hide: did")

    end
end


-- destroy()
function scene:destroy( event )

    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view
    print('PLAY  scene: destroy')
    bg1:removeEventListener('touch',movePers)
    bg2:removeEventListener('touch',movePers)
    bg3:removeEventListener('touch',movePers)
    bg4:removeEventListener('touch',movePers)
    bg5:removeEventListener('touch',movePers)
    bg6:removeEventListener('touch',movePers)
    audio.stop()
    audio.dispose( ostSnd1)
    audio.dispose( ostSnd2)
    audio.dispose( ostSnd3)
    ostSnd1 = nil
    ostSnd2 = nil
    ostSnd3 = nil
    sceneGroup:removeSelf()
    local options = {effect ='crossFade', time = 400}

    if p == 1 then
    composer.gotoScene('scenes.menu', options)
    end

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
