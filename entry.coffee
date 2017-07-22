
# =============================================================================
# Entry point to the client-size app.
# BABYLON is expected to be defined as a global already
# =============================================================================

# -----------------------------------------------------------------------------
# Makes $ available globally
# -----------------------------------------------------------------------------

window.$ = require 'jquery'

# -----------------------------------------------------------------------------
# Loads templates from slim files and attaches them to the DOM
# -----------------------------------------------------------------------------

$layout_content = $ require "html-loader!./templates/layout.slim"
$root_content = $ require "html-loader!./templates/root.slim"
$ ->
  $layout_wrapper = $ "#layout-wrapper"
  $layout_wrapper.append($layout_content)
  $root_wrapper = $ "#root-wrapper"
  $root_wrapper.append($root_content)
  
# -----------------------------------------------------------------------------
# Requires the game/scenes and starts them.
# -----------------------------------------------------------------------------

$ ->
  Game = require('./game.coffee').load(BABYLON)
  game = Game.init()
  Scenes = require("./lib/scenes.coffee").load(BABYLON, game)
  { scene } = Scenes.Tunnel.build()
  game.start(scene, ->)

# -----------------------------------------------------------------------------
# Loads styles and attaches them to DOM
# -----------------------------------------------------------------------------

require './style.sass'

