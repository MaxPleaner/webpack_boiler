module.exports = Engine = load: (BABYLON) -> (->

  @create = (canvas) ->
    new BABYLON.Engine canvas, true

  @auto_resize = (engine) ->
    $(window).on "resize", -> engine.resize()

  # Starts the game's event loop and displays it.
  # The tick_callback here is called before render
  @start_render_loop = (engine, scene, tick_callback) ->
    engine.runRenderLoop ->
      tick_callback() if tick_callback
      scene.render()

  this
).apply {}
