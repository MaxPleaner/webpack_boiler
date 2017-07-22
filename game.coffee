
# =============================================================================
# A minimal wrapper for a game object.
# Creates canvas & engine references.
# The scene gets constructed externally and passed to @start as an argument
# Includes helper methods which can be used by scenes
# =============================================================================

Game = module.exports = load: (BABYLON) -> (->

  @Helpers = require('./lib/helpers.coffee').load(BABYLON)
  { DOM, Engine } = @Helpers

  @init = =>
    @canvas = DOM.get_canvas "#game-wrapper"
    @engine = Engine.create @canvas
    this

  @started = false

  @start = (scene, tick_callback) =>
    throw("loop already started") if started
    started = !started
    Engine.start_render_loop @engine, scene, tick_callback
    
  this

).apply {}
