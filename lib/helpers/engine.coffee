module.exports = Engine = load: (BABYLON) -> (->
  @create = (canvas) ->
    new BABYLON.Engine canvas, true

  @auto_resize = (engine) ->
    $(window).on "resize", -> engine.resize()

  @start_render_loop = (engine, scene, tick_callback) ->
    engine.runRenderLoop ->
      scene.render()
      tick_callback() if tick_callback
  this
).apply {}
