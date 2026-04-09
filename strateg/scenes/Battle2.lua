
local composer = require('composer')
local widget = require('widget')
local physics = require('physics')






------------------------------

local mas


local mainSndOptions =
{
channel = 1,

}
audio.setVolume( 1, {channel=1} )
audio.setVolume( 0.8, {channel=2} )
audio.setVolume( 0.8, {channel=3} )
local ost




--------------------

local function remAll()
--  physics.stop()
  timer.cancelAll()
  Runtime:removeEventListener("enterFrame", onUpdate)


  bgHero:removeEventListener('touch', movePers)
  bgHero2:removeEventListener('touch', movePers)
end

local function goSomewhere()
  composer.removeScene( 'scenes.Battle2' )

end

local function finish(res)
  remAll()

  text = display.newText(res, display.contentCenterX, 140, native.system, 80)

  if res == 'Поражение!' then
    newButton = widget.newButton( {
      shape = 'roundedRect', cornerRaduis = 80,
      width = 500, height = 160, left = display.contentCenterX-250,
      top = display.contentCenterY+100,
      label = 'В меню', fontSize = 60,
      onPress = function()
        text:removeSelf()
        newButton:removeSelf()

        composer.hideOverlay( 'scenes.Battle2' )
        composer.removeHidden( )

        perh.isVisible = true
        newBuutton.isVisible = true
      end
    } )
  else
    newButton = widget.newButton( {
      shape = 'roundedRect', cornerRaduis = 80,
      width = 500, height = 160, left = display.contentCenterX-250,
      top = display.contentCenterY+100,
      label = 'На карту', fontSize = 60,
      onPress = function()
        text:removeSelf()
        newButton:removeSelf()



        composer.hideOverlay( 'scenes.Battle2' )
        composer.removeHidden( )
      end
    } )
  end




end


local function onScreen(grp)
     physics.start()

audio.play(ost, {loops=-1})
  local heroAtt = audio.loadSound('snd/heroattack.mp3')
  local heroMov = audio.loadSound('snd/heromove.mp3')
  local enemyAtt = audio.loadSound('snd/bossAttack.mp3')
  local enemyMov = audio.loadSound('snd/bossmove.mp3')



  local bg = display.newImageRect(grp, 'img/bg2.png',1950, 1100)
  bg.x, bg.y = display.contentCenterX, display.contentCenterY


  local f1 = true;
  local f2 = false
  local f3 = false
  local f4 = false
  local fight1 = false


  hero = display.newImageRect(grp,'img/hero.png', 110, 170)
  hero.x, hero.y =  140, 500
  hero:scale(-1,1)
  --hero:setFillColor(123/255, 255/255, 10/255)
  hero.HP = HP1
  hero.HPtext = display.newText(grp, hero.HP, hero.x+65, hero.y+125, native.system, 50)
  hero.HPtext:setFillColor(200/255, 12/255, 80/255)
  hero.HPText = display.newText(grp, 'HP', hero.x-15, hero.y+125, native.system, 50)
  hero.HPText:setFillColor(200/255, 12/255, 80/255)
  physics.addBody( hero, 'dinamic' )
  hero.gravityScale = 0
  hero.isSensor = true
  hero.ID = 'hero'

    bgHero = display.newRect(grp, hero.x, hero.y, 700, 700)
    bgHero:setFillColor(80/255, 80/255,80/255, 0.3)

    --hero 2
    hero2 = display.newImageRect(grp,'img/sputnik.png', 130, 160)
    hero2.x, hero2.y =  100, 800
    hero2:scale(-1,1)
    hero2.HP = HP2
    hero2.HPtext = display.newText(grp, hero2.HP, hero2.x+65, hero2.y+125, native.system, 50)
    hero2.HPtext:setFillColor(200/255, 12/255, 80/255)
    hero2.HPText = display.newText(grp, 'HP', hero2.x-15, hero2.y+125, native.system, 50)
    hero2.HPText:setFillColor(200/255, 12/255, 80/255)
    physics.addBody( hero2, 'dinamic' )
    hero2.gravityScale = 0
    hero2.isSensor = true
    hero2.ID = 'hero'

      bgHero2 = display.newRect(grp, hero2.x, hero2.y, 700, 700)
      bgHero2:setFillColor(80/255, 80/255,80/255, 0.3)
      bgHero2.isVisible = false
    --

  function movePers(event)
    if (f1 == true) then
      hero:addEventListener('collision', hero)


    if (hero.x == mas[i-1].x and hero.y == mas[i-1].y) then
      audio.play(heroAtt, {channel=2})
        -------------------
        mas[i-1].x = mas[i-1].x + 30
        local function shake()
          mas[i-1].x = mas[i-1].x - 30
        end
        timer.performWithDelay( 250, shake, 2 )
        local function shake2()
          mas[i-1].x = mas[i-1].x + 30
        end
        timer.performWithDelay( 300, shake2 )

        ---
        mas[i-1].HP = mas[i-1].HP - math.random(3,6)
        mas[i-1].HPtext.text = mas[i-1].HP
        ----------------------

    elseif (hero.x == mas[i-2].x and hero.y == mas[i-2].y) then
      audio.play(heroAtt, {channel=2})
      -------------------
        mas[i-2].x = mas[i-2].x + 30
        local function shake()
          mas[i-2].x = mas[i-2].x - 30
        end
        timer.performWithDelay( 250, shake, 2 )
        local function shake2()
          mas[i-2].x = mas[i-2].x + 30
        end
        timer.performWithDelay( 300, shake2 )

        ---
        mas[i-2].HP = mas[i-2].HP - math.random(3,6)
        mas[i-2].HPtext.text = mas[i-2].HP
        ----------------------
    end

    audio.play(heroMov, {channel=3})
    transition.to( hero, {x=event.x, y=event.y, time=1000} )

    hero.HPtext.isVisible = false
    hero.HPText.isVisible = false
    bgHero.isVisible = false;

    local function t()
      hero.HPtext.x, hero.HPtext.y = hero.x+65, hero.y+125
      hero.HPText.x, hero.HPText.y = hero.x-15, hero.y+125
      hero.HPtext.isVisible = true
      hero.HPText.isVisible = true

      f1 = false; f2 =true;
      bgHero2.x,bgHero2.y = hero2.x, hero2.y
      bgHero2.isVisible = true;

      hero:removeEventListener('collision', hero)
    end
    t = timer.performWithDelay( 1000, t )
  else
    hero2:addEventListener('collision', hero2)


    if (hero2.x == mas[i-1].x and hero2.y == mas[i-1].y) then
      audio.play(heroAtt, {channel=2})
        -------------------
        mas[i-1].x = mas[i-1].x + 30
        local function shake()
          mas[i-1].x = mas[i-1].x - 30
        end
        timer.performWithDelay( 250, shake, 2 )
        local function shake2()
          mas[i-1].x = mas[i-1].x + 30
        end
        timer.performWithDelay( 300, shake2 )

        ---
        mas[i-1].HP = mas[i-1].HP - math.random(2,5)
        mas[i-1].HPtext.text = mas[i-1].HP
        ----------------------

      elseif (hero.x == mas[i-2].x and hero.y == mas[i-2].y) then
        audio.play(heroAtt, {channel=2})
        -------------------
          mas[i-2].x = mas[i-2].x + 30
          local function shake()
            mas[i-2].x = mas[i-2].x - 30
          end
          timer.performWithDelay( 250, shake, 2 )
          local function shake2()
            mas[i-2].x = mas[i-2].x + 30
          end
          timer.performWithDelay( 300, shake2 )

          ---
          mas[i-2].HP = mas[i-2].HP - math.random(2,5)
          mas[i-2].HPtext.text = mas[i-2].HP
          ----------------------
    end

    audio.play(heroMov, {channel=3})
    transition.to( hero2, {x=event.x, y=event.y, time=1000} )

    hero2.HPtext.isVisible = false
    hero2.HPText.isVisible = false
    bgHero2.isVisible = false;

    local function t()
      hero2.HPtext.x, hero2.HPtext.y = hero2.x+65, hero2.y+125
      hero2.HPText.x, hero2.HPText.y = hero2.x-15, hero2.y+125
      hero2.HPtext.isVisible = true
      hero2.HPText.isVisible = true

      if mas[i-1].isVisible == false then
        f4 = true
      else
        f3 = true
      end

      bgHero.x,bgHero.y = hero.x, hero.y
    --  f2 = false; f1 =true;
      --bgHero.isVisible = true;
      hero2:removeEventListener('collision', hero2)
    end
    t = timer.performWithDelay( 1000, t )
    end



  end
  bgHero:addEventListener('touch', movePers)
  bgHero2:addEventListener('touch', movePers)





local px = 200
i = 1

local jj = 1
local enm = {'img/enemy.png','img/boss.png'}

function spawn()

  mas[i] = display.newImageRect(grp,enm[jj], 135, 210)

  mas[i].x, mas[i].y =  1800, px
  if jj == 1 then
  mas[i].HP = 25
else
  mas[i].HP = 32
  end
    jj = jj + 1
  mas[i].HPtext = display.newText(grp, mas[i].HP, mas[i].x+65, mas[i].y+125, native.system, 50)
  mas[i].HPtext:setFillColor(70/255, 255/255, 10/255)
  mas[i].HPText = display.newText(grp, 'HP', mas[i].x-15, mas[i].y+125, native.system, 50)
  mas[i].HPText:setFillColor(70/255, 255/255, 10/255)
  physics.addBody( mas[i], 'dinamic' )
  mas[i].gravityScale = 0
  mas[i].isSensor = true

  mas[i].ID = 'enemy'

px = px + 400
i = i + 1
end--################

spawn()
spawn()

enemy1 = mas[i-1]
enemy2 = mas[i-2]

local function crushh(self, event)
  if (event.phase=='began' and event.other.ID == 'enemy') then

--[[
    event.other.x = event.other.x + 30
    local function shake()
      event.other.x = event.other.x - 30
    end
    timer.performWithDelay( 250, shake, 2 )
    local function shake2()
      event.other.x = event.other.x + 30
    end
    timer.performWithDelay( 300, shake2 )
]]
    ---
    audio.play(heroAtt, {channel = 1, loops=-1})
    event.other.HP = event.other.HP - math.random(3,5)
    event.other.HPtext.text = event.other.HP

  end
end


hero.collision = crushh
hero2.collision = crushh






function moveEn(vrag)

    if vrag=='enemy' then

      mas[i-1].HPtext.isVisible = false
      mas[i-1].HPText.isVisible = false

      if (mas[i-1].x - hero.x <= mas[i-1].x-hero2.x) then

        if (mas[i-1].x -hero.x <= 400) then
          audio.play(enemyMov)
        transition.to(mas[i-1], {x=hero.x,y=hero.y, time=1200})

----------------------------------------
        hero.x = hero.x + 30
        local function shake()
          hero.x = hero.x - 30
        end
        timer.performWithDelay( 250, shake, 2 )
        local function shake2()
          hero.x = hero.x + 30
          audio.play(enemyAtt)
        end
        timer.performWithDelay( 300, shake2 )

        ---
        hero.HP = hero.HP - math.random(3,4)
        hero.HPtext.text = hero.HP
        -------------------------------

      else
        audio.play(enemyMov)
        transition.to(mas[i-1], {x=mas[i-1].x-400,y=hero.y, time=1200})
        end


        local function t()
          mas[i-1].HPtext.x, mas[i-1].HPtext.y = mas[i-1].x+65, mas[i-1].y+125
          mas[i-1].HPText.x, mas[i-1].HPText.y = mas[i-1].x-15, mas[i-1].y+125
          mas[i-1].HPtext.isVisible = true
          mas[i-1].HPText.isVisible = true

          f3 = false;
          if (mas[i-2].isVisible == true) then
            f4 = true
          else
          bgHero.isVisible = true;
          end


        end
        t = timer.performWithDelay( 1200, t )
      else

        if (mas[i-1].x -hero2.x <= 400) then
        transition.to(mas[i-1], {x=hero2.x,y=hero2.y, time=1200})
        audio.play(enemyMov)
        ----------------------------------------
                hero2.x = hero2.x + 30
                local function shake()
                  hero2.x = hero2.x - 30
                end
                timer.performWithDelay( 250, shake, 2 )
                local function shake2()
                  hero2.x = hero2.x + 30
                  audio.play(enemyAtt)
                end
                timer.performWithDelay( 300, shake2 )

                ---
                hero2.HP = hero2.HP - math.random(3,4)
                hero2.HPtext.text = hero2.HP
                -------------------------------

          else
            audio.play(enemyMov)
            transition.to(mas[i-1], {x=mas[i-1].x-400,y=hero2.y, time=1200})
            end

            local function t()
              mas[i-1].HPtext.x, mas[i-1].HPtext.y = mas[i-1].x+65, mas[i-1].y+125
              mas[i-1].HPText.x, mas[i-1].HPText.y = mas[i-1].x-15, mas[i-1].y+125
              mas[i-1].HPtext.isVisible = true
              mas[i-1].HPText.isVisible = true

              f3 = false;
              if (mas[i-2].isVisible == true) then
                f4 = true
              else
              bgHero.isVisible = true;
              end

            end
            t = timer.performWithDelay( 1200, t )
          end
        end------ENEMY1



        if vrag=='enemy2' then

          mas[i-2].HPtext.isVisible = false
          mas[i-2].HPText.isVisible = false

          if (mas[i-2].x - hero.x <= mas[i-1].x-hero2.x) then

            if (mas[i-2].x -hero.x <= 400) then
              audio.play(enemyMov)
            transition.to(mas[i-2], {x=hero.x,y=hero.y, time=1200})

    ----------------------------------------
            hero.x = hero.x + 30
            local function shake()
              hero.x = hero.x - 30
            end
            timer.performWithDelay( 250, shake, 2 )
            local function shake2()
              hero.x = hero.x + 30
              audio.play(enemyAtt)
            end
            timer.performWithDelay( 300, shake2 )

            ---
            hero.HP = hero.HP - math.random(2,3)
            hero.HPtext.text = hero.HP
            -------------------------------

          else
            audio.play(enemyMov)
            transition.to(mas[i-2], {x=mas[i-2].x-400,y=hero.y, time=1200})
            end


            local function t()
              mas[i-2].HPtext.x, mas[i-2].HPtext.y = mas[i-2].x+65, mas[i-2].y+125
              mas[i-2].HPText.x, mas[i-2].HPText.y = mas[i-2].x-15, mas[i-2].y+125
              mas[i-2].HPtext.isVisible = true
              mas[i-2].HPText.isVisible = true

              f4 = false
              bgHero.isVisible = true;   f1 =true;


            end
            t = timer.performWithDelay( 1200, t )
          else

            if (mas[i-2].x -hero2.x <= 400) then
              audio.play(enemyMov)
            transition.to(mas[i-2], {x=hero2.x,y=hero2.y, time=1200})

            ----------------------------------------
                    hero2.x = hero2.x + 30
                    local function shake()
                      hero2.x = hero2.x - 30
                    end
                    timer.performWithDelay( 250, shake, 2 )
                    local function shake2()
                      hero2.x = hero2.x + 30
                      audio.play(enemyAtt)
                    end
                    timer.performWithDelay( 300, shake2 )

                    ---
                    hero2.HP = hero2.HP - math.random(2,3)
                    hero2.HPtext.text = hero2.HP
                    -------------------------------

          else
            audio.play(enemyMov)
            transition.to(mas[i-2], {x=mas[i-2].x-400,y=hero2.y, time=1200})
            end

            local function t()
              mas[i-2].HPtext.x, mas[i-2].HPtext.y = mas[i-2].x+65, mas[i-2].y+125
              mas[i-2].HPText.x, mas[i-2].HPText.y = mas[i-2].x-15, mas[i-2].y+125
              mas[i-2].HPtext.isVisible = true
              mas[i-2].HPText.isVisible = true

              f4 = false
              bgHero.isVisible = true;   f1 =true;

            end
            t = timer.performWithDelay( 1200, t )
          end
        end------ENEMY2

end---------MOVE






    hero:toFront()
  function onUpdate()

    if (mas[i-1].HP > 0) then
      if (f3==true) then
        moveEn('enemy')
        f3 = false
      end
    else
      mas[i-1].isVisible = false
    end

    if (mas[i-2].HP > 0) then
      if (f4==true) then
        moveEn('enemy2')
        f4 = false
      end
    else
      mas[i-2].isVisible = false
    end

    if (hero.HP <= 0 or hero2.HP <= 0) then
      finish('Поражение!')
    end

  if (mas[i-1].HP <= 0 and mas[i-2].HP <= 0) then
    finish('Победа!')
  end







  end
  Runtime:addEventListener("enterFrame", onUpdate)


end------######



local scene = composer.newScene(  )

function scene:create(event)
    local sceneGroup = self.view
    ost = audio.loadSound('snd/COMBAT02.mp3')
    mas = {}

end


function scene:show(event)
    local sceneGroup = self.view

    if (event.phase == 'will') then

    end---

    if (event.phase == 'did') then
      perh.isVisible = false
      onScreen(sceneGroup)

    end---



end----------------------



function scene:destroy(event)
    local sceneGroup = self.view
    audio.stop()
    audio.dispose( ost )
    ost = nil
    sceneGroup:removeSelf()


end


scene:addEventListener('create', scene)
scene:addEventListener('show', scene)
scene:addEventListener('destroy', scene)
return scene
