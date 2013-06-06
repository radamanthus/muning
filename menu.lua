local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

local ui = require "scripts.lib.ui"
local radlib = require "scripts.lib.radlib"

---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------
local screen = nil

function scene:createScene( event )
  screen = self.view

  local startButton = nil
  local function onStartPressed ( event )
    if event.phase == "ended" and startButton.isActive then
      storyboard.gotoScene( "start" )
    end
  end
  startButton = ui.newButton(
    radlib.table.merge(
      _G.buttons['start'],
      { onRelease = onStartPressed }
    )
  )
  startButton.x = 160
  startButton.y = 80
  startButton.isActive = true
  screen:insert(startButton)

  local settingsButton = nil
  local function onSettingsPressed( event )
    if event.phase == "ended" and settingsButton.isActive then
      storyboard.gotoScene( "settings" )
    end
  end
  settingsButton = ui.newButton(
    radlib.table.merge(
      _G.buttons['settings'],
      { onRelease = onSettingsPressed }
    )
  )
  settingsButton.x = 160
  settingsButton.y = 130
  settingsButton.isActive = true
  screen:insert(settingsButton)

  local aboutButton = nil
  local function onAboutPressed( event )
    if event.phase == "ended" and aboutButton.isActive then
      storyboard.gotoScene( "about" )
    end
  end
  aboutButton = ui.newButton(
    radlib.table.merge(
      _G.buttons['about'],
      { onRelease = onAboutPressed }
    )
  )
  aboutButton.x = 160
  aboutButton.y = 180
  aboutButton.isActive = true
  screen:insert(aboutButton)

  local helpButton = nil
  local function onHelpPressed( event )
    if event.phase == "ended" and helpButton.isActive then
      storyboard.gotoScene( "help" )
    end
  end
  helpButton = ui.newButton(
    radlib.table.merge(
      _G.buttons['help'],
      { onRelease = onHelpPressed }
    )
  )
  helpButton.x = 160
  helpButton.y = 230
  helpButton.isActive = true
  screen:insert(helpButton)
end

function scene:enterScene( event )
  print("Menu loaded...")

  storyboard.removeAll()
end

function scene:exitScene( event )
end

function scene:destroyScene( event )
end

---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------
--
-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )

-- "exitScene" event is dispatched before next scene's transition begins
scene:addEventListener( "exitScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )
---------------------------------------------------------------------------------

return scene
