



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
audio.setVolume( 1, {channel=1} )
local adSndOptions ={
  channel = 2 }
audio.setVolume( 0.5 , {channel = 2})
audio.setVolume( 0.5 , {channel = 3})
audio.setVolume( 0.5 , {channel = 4})



--audio.getMaxVolume( { channel=1 } )

local armSnd
local shSnd
local spSnd

--RENDERING OBJECTS
local bg
local mas
------------------------

--CLOSE GAME
local function stopListener()
  bg:removeEventListener('touch', rotateOB)
  Runtime:removeEventListener("enterFrame", onUpdate)
  timer.cancelAll()
end

--STOP PHYSICS Aother
local function stopPhysics()
  physics.stop()
end

--------------------------------
--PEREHOD
local function goSomewhere(event)
  --STOP ALL------------
    --[[ ]]
  stopPhysics()
  stopListener()

  local goto = event.target.id
  p.isVisible = true
  pt.isVisible = true
  local options = {effect ='crossFade', time = 400}
  composer.removeScene('scenes.nPlay2', false)
  composer.gotoScene(goto)
  victory = false
end

--PEREHOD
local function goSomeWhere(event)
  --STOP ALL------------

  --[[  ]]
  local goto = event.target.id
  --p.isVisible = true
  --pt.isVisible = true
  --local options = {effect ='crossFade', time = 400}
  composer.removeScene('scenes.nPlay2', false)
  composer.gotoScene(goto)
end
--PEREHOD
local function replay(event)
  --STOP ALL------------
  stopPhysics()
  stopListener()



  --local f = display.newRect(d_X, d_Y, 1080, 1920)
  --f:setFillColor(123/255, 212/255, 111/255)
  local ft = display.newText(event, d_X, d_Y, native.system, 80)
  ft:setFillColor(200/255, 10/255, 120/255)
  local rt = display.newText('Retry?', d_X, d_Y+200, native.system, 80)
  local function retry()
    --f:removeSelf()
    ft:removeSelf()
    rt:removeEventListener('tap', retry)
    rt:removeSelf()
    --p.isVisible = true
    --composer.removeScene('scenes.nPlay', false)
    --composer.gotoScene('scenes.nMenu')
  end
  rt:addEventListener('tap', retry)

     --[[
  --Main menu button
  newButton = widget.newButton {
        shape = 'roundedRect', cornerRadius = 40,
        width = 400, height = 80,
        left = 0, top = 20,

        fillColor = { default={249/255,243/255, 245/255, 0},over={150/255,0.3}},
        labelColor = {default={25/255,120/255,255/255}, over={1}},
        label = 'Меню',
        fontSize = 60, labelAlign = center,
        id="scenes.nMenu",
        onRelease=goSomeWhere,
  }]]


end

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
        id="scenes.nMenu",
        onRelease=goSomewhere,
  }
  grp:insert(newButton)

end--END OF MAIN FUNCTION



-------------------
--characters
local function chars(grp)
  -------------------------------
  physics.start()

  --Animation
  local spider_info = require('img.enemies1')
  local spider_sheet = graphics.newImageSheet('img/enemies1.png', spider_info:getSheet());

  local spider_data = {
    {
      name = 'attack',
      sheet = spider_sheet,
      start = 1,
      count = 4,
      time = 800,
      loopCount = 0,
    }
  }
  ----------------------------------------
 local sc = 0;
 local score = display.newText(grp,sc, 1015, 60, native.system, 62);
 score:setFillColor(30/255, 255/255, 85/255)
 local scoreText = display.newText(grp,'СЧЁТ:', 880, 60, native.system, 60);
 scoreText:setFillColor(30/255, 255/255, 85/255)
---TEXT

  -----------------------GUN------------------------------
  gun = display.newImageRect(grp,'img/hero2.png', 135, 200)
  gun.x, gun.y = display.contentCenterX, 1700
  gun:scale(1,-1)
  gun.Health = 100
  physics.addBody( gun, "static" )
  gun.id="scenes.nMenu"
  -------HP__CRUSH
  local function crush(self, event)
    if(event.phase == 'began' and event.other.ID == 'ENEMY') then
      gun.Health = gun.Health - 20;
      event.other:pause()
      if (gun.Health <=0) then
        replay('DEAD')
      end
      healthText.text = gun.Health
    end
  end
  gun.collision = crush
  gun:addEventListener('collision', gun)

  --HEALTH INterface
  HI = display.newRect(grp, 150, 1800, 250, 100)
  HI:setFillColor(177/255)
  HT = display.newText(grp, 'HP: ', 100, 1800, native.system, 62)
  HT:setFillColor(220/255,1/255,1/255)
  healthText = display.newText(grp,gun.Health,200, 1800, native.system, 60)
  healthText:setFillColor(150/255,22/255,22/255)
------------ARMs
  local AI = display.newRect(grp, 870, 1800, 350, 100)
  AI:setFillColor(177/255)
  local arm = 18
  local Arm = display.newText(grp, arm, 1000, 1800, native.system, 65)
  Arm:setFillColor(250/255,142/255,70/255)
  local armText = display.newText({
    parent = grp,
    text = 'Патроны:',
    x = 830, y = 1800,
    fontSize = 55,
  })
  armText:setFillColor(176/255,72/255,70/255)

  --shooting
  function sh(event)
    if (arm~= 0) then
      audio.play(shSnd, adSndOptions)
      local actualBoxX, actualBoxY = gun:localToContent(0,0)
      local bullet = display.newImageRect(grp, 'img/bullet.png', 23, 55)
      bullet.x, bullet.y = actualBoxX, actualBoxY;
      physics.addBody( bullet, 'dinamic', {isSensor=true} )
      local angle = -math.rad(gun.rotation +90)
      local xComp = math.cos(angle)
      local yComp = -math.sin(angle)
      print("+")
      bullet:applyLinearImpulse(-3*xComp,-3*yComp, gun.x, gun.y)
      print("+")
      arm = arm - 1;
      Arm.text = arm
      local function cr()
        bullet:removeSelf()
      end
      bullet.ID = 'bullet'
      bullet.Timer = timer.performWithDelay( 2000, cr )
    end
  end

  function rotateOB(event)
      if(event.phase=='began') then
        gun.rotation = math.ceil(math.atan2((event.y - gun.y), (event.x - gun.x))*180/math.pi)+90
      end
      if (event.phase == 'moved') then
        gun.rotation = math.ceil(math.atan2((event.y-gun.y), (event.x-gun.x))*180/math.pi)+90
      end
      if (event.phase=='ended' or event.phase == 'cancelled') then
        sh()
      end
  end
  bg:addEventListener('touch', rotateOB) --LISTENER



  local function recharge()
    local function a()
      audio.play(armSnd, adSndOptions)
      arm = 18
      Arm.text = arm
    end
    aT = timer.performWithDelay(1200, a)
  end



--------------------------ENMIES_--------------------------------
local COUNT = 0; local c = 6;
 function spawn()
  --ENEMIES

  local function movePers(event)
      for i= 0,c do
      transition.moveTo(mas[i], {x = gun.x, y = gun.y, time=3400})
      end
  end

 function crash(self, event)
    if (event.phase == 'began' and event.other.ID == 'bullet') then
      audio.play(spSnd, adSndOptions)
      self.HP = self.HP - 1;
      if(self.HP == 0) then
        --self.removeEventListener('collision', crash)
        timer.cancel(event.other.Timer)
        event.other:removeSelf()
        timer.cancel(self.Timer)
        self:removeSelf()
        audio.play(spSnd)

        if (math.random(0, 25) >= 25) then
          timer.performWithDelay( 1000, spawnHP )
        end

        --
        self.isALIVE = false
        COUNT = COUNT - 1
        sc = sc + 1
        score.text = sc

          for i= 0, c do
            if (mas[i] ~= nil) then
              if(mas[i].isALIVE == false) then
                mas[i] = nil
          end
          end
          end

      end
    end

  end--END OF CRUSH


  for i = 0, c do
    if (mas[i] == nil) then

      local x = math.random(0, 1080)
      local y = math.random(-100, 0)
      --mas[i] = display.newCircle(x, y,50)
      mas[i] = display.newSprite(spider_sheet, spider_data);
      mas[i].x = x; mas[i].y = y;
      mas[i]:setSequence('attack')
      mas[i]:play();

      --mas[i]:setFillColor(0, 120/255, 200/255)
      mas[i].ID = 'ENEMY'
      mas[i].HP = 2;

      physics.addBody(mas[i], 'dinamic')
      mas[i].isALIVE = true
      mas[i].gravityScale = 0
      mas[i].isSensor = true
      mas[i].Timer = timer.performWithDelay( 500, movePers )
      mas[i].collision = crash
      mas[i]:addEventListener('collision', mas[i])

      grp:insert(mas[i])
      COUNT = COUNT + 1

    end
  end

end--END OF ENEMY

spawnTimer = timer.performWithDelay(3000, spawn, 8)
--3 = 16


function spawnHP()
  local function crush(self, event)
    if(event.phase=='began' and event.other.ID == 'bullet') then
      gun.Health = gun.Health  + 30;
      healthText.text = gun.Health;
      self:removeEventListener('collision', self)
      self:removeSelf()
    end
  end


  local x = math.random(0, 1000)
  local y = 0;
  local HP = display.newImageRect(grp,'img/HP.png', 100, 115)
  HP.x = x; HP.y = y;
  --HP.isSensor = true;
  physics.addBody(HP, 'dinamic')
  HP.collision = crush
  HP:addEventListener('collision', HP)
end
tHP = timer.performWithDelay( 1000, spawnHP)



function onUpdate()
  if arm==0 then
    recharge()
  end

  if sc == 35 then
    c = 8
    spawnTimer = timer.performWithDelay( 5000, spawn, 0 )
  end

  if sc == 80 then
    replay('Victory!')
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
    print("menu scene:create")
    bg = display.newImageRect(sceneGroup, 'img/hero32.jpg', 1500, 1920)
    bg.x = display.contentCenterX; bg.y = display.contentCenterY;
    ostSnd = audio.loadSound('snd/mus/batle.ogg', mainSndOptions)
    armSnd = audio.loadSound('snd/arm.wav', adSndOptions)
    shSnd = audio.loadSound('snd/shot.wav', adSndOptions)
    spSnd = audio.loadSound('snd/moDeath.wav', adSndOptions)

    mas = {}

    --RENDERING
    createPlayScreen(sceneGroup)




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
        sceneGroup:removeSelf()



    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
        print("play:hide: did")
        composer.removeScene('scenes.nPlay2')


    end
end


-- destroy()
function scene:destroy( event )

    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view
    print('HIDE: DESTORY')
    sceneGroup:removeSelf()
    --composer.removeScene('scenes.nPlay', false)
    audio.stop()
    audio.dispose( ostSnd )



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
