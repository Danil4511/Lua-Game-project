



local composer = require( "composer" )
local widget = require('widget')
widget.setTheme ( "widget\_theme\_ios" )


local scene = composer.newScene()
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
--BASIC settings
local bg
local mainSndOptions =
{
channel = 1,
loops = -1,
fadein = 5000,
}
audio.setVolume( 0.6, {channel=1} )
local adSndOptions =
{
channel = 2,
}
audio.setVolume( 0.5, {channel=2} )
--audio.getMaxVolume( { channel=1 } )
local ostSnd
local shotSnd
local spSnd
local armSnd
local mas
local score
local scoreText
local arm
local Arm
local armText
local wave

local spawnTimer
local lvl2Timer
local finish


local function pause()
  spawnTimer = false
  if (wave=='Волна 2') then
  lvl2Timer = false
end
  audio.pause()
  physics.pause()
  transition.pauseAll()
end

local function retryLevel()
  Runtime:removeEventListener( "enterFrame", onUpdate )
    victory = false
    p.isVisible = true
    local options = {effect="crossFade", time=300}
    --composer.removeScene('scenes.play')
    composer.gotoScene( 'scenes.MainMenu', options )
    --composer.gotoScene('scenes.play')
end



function cont()
  audio.resume()
  physics.start()
  transition.resume()
end

----------------
local function goSomewhere(event)

    local goto = event.target.id
    local options = {}
    if goto == "scenes.pause" then
      finish = false
      pause()
        options = {effect="fromTop", time=300, isModal=true}
        composer.showOverlay( goto, options )
    else
      finish = true
      victory = true
      p.isVisible = true;
        options = {effect="crossFade", time=300}
        composer.gotoScene( goto, options )
    end
end


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
        id="scenes.MainMenu",
        onRelease=goSomewhere,
  }
  grp:insert(newButton)

--[[
  --Main pause button
  newButton = widget.newButton {
        shape = 'roundedRect', cornerRadius = 40,
        width = 400, height = 80,
        left = 0, top = 120,

        fillColor = { default={249/255,243/255, 245/255, 0},over={150/255,0.3}},
        labelColor = {default={200/255,30/255,50/255}, over={1}},
        label = 'Пауза',
        fontSize = 60, labelAlign = center,
        id="scenes.pause",
        onRelease=goSomewhere,
  }
  grp:insert(newButton)
]]

end--END OF MAIN FUNCTION

local function timers(grp)
----
--Animation
local spider_info = require('img.spiders')
local spider_sheet = graphics.newImageSheet('img/spiders.png', spider_info:getSheet());

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


----




  --Gun
  -----------
  gun = display.newImageRect(grp,'img/hero2.png', 135, 200)
  gun.x, gun.y = display.contentCenterX, 1700
  gun:scale(1,-1)
  gun.Health = 100
  local healthText = display.newText(grp,gun.Health,100, 1800, native.system, 50)
  healthText:setFillColor(220/255,20/255,50/255)
  physics.addBody( gun, "static" )

  local function crush(self, event)
    if(event.phase == 'began' and event.other.ID == 'ENEMY') then
      gun.Health = gun.Health - 20;
      if (gun.Health <= 0) then
        finish = true
        retryLevel()
        return
      end
      healthText.text = gun.Health
    end

  end
  gun.collision = crush
  gun:addEventListener('collision', gun)
  --gun:setFillColor(1,0,0);


  --shooting
  local function sh(event)
    if (arm~= 0) then

      audio.play(shotSnd, adSndOptions)
      local actualBoxX, actualBoxY = gun:localToContent(0,0)
      local bullet = display.newImageRect(grp, 'img/bullet.png', 23, 55)
      bullet.x, bullet.y = actualBoxX, actualBoxY;
      --local bullet = display.newCircle(grp, actualBoxX+20, actualBoxY-20, 20)
      physics.addBody( bullet, 'dinamic', {isSensor=true} )
      --bullet:setFillColor(1, 0, 0, 1)
      local angle = -math.rad(gun.rotation +90)
      local xComp = math.cos(angle)
      local yComp = -math.sin(angle)
      bullet:applyLinearImpulse(-3*xComp,-3*yComp, gun.x, gun.y)

      arm = arm - 1;
      Arm.text = arm
      local function cr()
        bullet:removeSelf()
      end
      bullet.ID = 'bullet'
      bullet.Timer = timer.performWithDelay( 2000, cr )
    end
  end

  local function rotateOB(event)
      if(event.phase=='began') then
        gun.rotation = math.ceil(math.atan2((event.y - gun.y), (event.x - gun.x))*180/math.pi)+90
        --tt = timer.performWithDelay( 300, sh, 0 )
      end
      if (event.phase == 'moved') then
        gun.rotation = math.ceil(math.atan2((event.y-gun.y), (event.x-gun.x))*180/math.pi)+90
      end
      if (event.phase=='ended' or event.phase == 'cancelled') then
        sh()
        --timer.cancel(tt)
  end

  end
  bg:addEventListener('touch', rotateOB)

  local function recharge()
    local function a()
      arm = 20
      Arm.text = arm
    end
    timer.performWithDelay(1200, a)
  end

-----------------------------------------------
local COUNT = 0; local COUNT2 = 0;
local c = 6; local c2 = 10; local c3 = 10

  local function spawn()
    --ENEMIES

    local function movePers(event)
        for i= 0,c do
        transition.moveTo(mas[i], {x = gun.x, y = gun.y, time=3400})
        end
    end

   function crash(self, event)
      if (event.phase == 'began' and event.other.ID == 'bullet') then
        audio.play(spSnd, adSndOption)
       timer.cancel(event.other.Timer)
        event.other:removeSelf()
        timer.cancel(self.Timer)
        self:removeSelf()

        --
        self.isALIVE = false
        COUNT = COUNT - 1
        sc = sc + 1
        score.text = sc
        --

        for i= 0, c do
          if (mas[i] ~= nil) then
            if(mas[i].isALIVE == false) then
              mas[i] = nil
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

spawnTimer = timer.performWithDelay(100, spawn, 5)


local function spawn2()
  --ENEMIES

  local function movePers(event)
      for i= 0,c2 do
      transition.moveTo(mas[i], {x = gun.x, y = gun.y, time=3200})
      end
  end

 function crash(self, event)
    if (event.phase == 'began' and event.other.ID == 'bullet') then
      audio.play(spSnd, adSndOption)
     timer.cancel(event.other.Timer)
      event.other:removeSelf()
      timer.cancel(self.Timer)
      self:removeSelf()

      --
      self.isALIVE = false
      COUNT = COUNT - 1
      sc = sc + 1
      score.text = sc
      --

      for i= 0, c2 do
        if (mas[i] ~= nil) then
          if(mas[i].isALIVE == false) then
            mas[i] = nil
          end
        end
      end

    end


  end--END OF CRUSH

  for i = 0, c2 do
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

      physics.addBody(mas[i], 'dinamic')
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




local function onUpdate()
  if finish == true then
    Runtime:removeEventListener("enterFrame", onUpdate)
  end


  print(spawnTimer)
  if (sc == 6) then
    lvl2Timer = timer.performWithDelay(7000, spawn2, 4)
    wave.text = 'Волна 2'
  end

   if (arm==0) then
     audio.play(armSnd,adSndOptions)
     recharge()
   end



end
Runtime:addEventListener("enterFrame", onUpdate)




end -- END OF MAIN MAIN FUNCTION


----------------------------------------------







-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
    finish = false
    print("menu scene:create")
    bg = display.newImageRect(sceneGroup, 'img/level1.jpg', 1200, 1920)
    bg.x = display.contentCenterX; bg.y = display.contentCenterY;
    ostSnd = audio.loadSound('snd/mus/red_engines_blue_wings.ogg', mainSndOptions)
    shotSnd = audio.loadSound('snd/shot.wav', adSndOptions)
    spSnd = audio.loadSound('snd/spDeath.wav', adSndOptions)
    armSnd = audio.loadSound('snd/arm.wav', adSndOptions)
    mas = {}
    sc = 0
    score = display.newText(sceneGroup, sc, 960, 100, native.system, 75)
    scoreText = display.newText({
      parent = sceneGroup,
      text = 'Счёт: ',
      x = 850, y = 100,
      fontSize = 75,
    })
    arm = 20
    Arm = display.newText(sceneGroup, arm, 960, 1800, native.system, 75)
    armText = display.newText({
      parent = sceneGroup,
      text = 'Патроны: ',
      x = 780, y = 1800,
      fontSize = 50,
    })
    createPlayScreen(sceneGroup)
    wave = display.newText(sceneGroup, "Волна 1", 500, 80, native.system, 50)



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
          audio.play(ostSnd, mainSndOptions)
          physics.start()
          physics.setGravity(0, 0)
          timers(sceneGroup)
          --spawn(sceneGroup)
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
        --[[
        Runtime:removeEventListener( "enterFrame", onUpdate )
        if (wave.text == 'Волна 1') then
          timer.cancel(spawnTimer)
        end
        if wave.text == 'Волна 2' then
        timer.cancel(lvl2Timer)
        end
        audio.stop()
        audio.dispose( ostSnd)
        ostSnd = nil
        shotSnd = nil
        spSnd = nil
        armSnd = nil
        p.isVisible = false
        ]]
        composer.removeScene('scenes.play', false)


    end
end


-- destroy()
function scene:destroy( event )

    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view
    print('HIDE: DESTORY')





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
