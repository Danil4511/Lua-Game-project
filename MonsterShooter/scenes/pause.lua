


local composer = require( "composer" )
local widget = require('widget')
widget.setTheme ( "widget\_theme\_ios" )


local scene = composer.newScene()
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------


local function goSomewhere(event)
  local goto = event.target.id

  local options = {}
  if goto == "scenes.pause" then
      cont()
      composer.hideOverlay( true, "slideUp", 300 )
  else
      victory = true
      p.isVisible = true;
      options = {effect="crossFade", time=300}
      composer.gotoScene( goto, options )
  end


end


local function setUpDisplay(grp)


  local bg = display.newRect(
      grp,
      display.contentCenterX,
      display.contentCenterY,
      display.viewableContentWidth - 100,
      display.viewableContentHeight - 100
  )
  bg:setFillColor ( 0.53, 0.06, 0 )


  local title = display.newText(
      grp,
      "&lt;pause>",
      display.contentCenterX,
      display.contentCenterY,
      "Helvetica",
      48
  )
  title:setFillColor(0, 0, 0)
  local backBtn = widget.newButton ({
      left = 80, top = 500, height = 100, width = 400,
      label="Back", fontSize = 70,
      id="scenes.play",
      onRelease=goSomewhere
  })
  grp:insert(backBtn)

  local resumeBtn = widget.newButton ({
      left = 600, top = 500, height = 100, width = 400,
      label="resume", fontSize = 70,
      id="scenes.play",
      onRelease=goSomewhere
  })
  grp:insert(resumeBtn)

end

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
    print("menu scene:create")

    setUpDisplay(sceneGroup)



end--ENDING CREATING


-- show()
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
        print('pause scene:show will')


    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
          print('pause scene:show did')

    end


end


-- hide()
function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
        print("pause hide: will")


    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
        print("pause hide: did")
        sceneGroup:removeSelf()


    end
end


-- destroy()
function scene:destroy( event )

    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view
    print('pause destroy')

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
