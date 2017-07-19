Helpers = module.exports = load: (BABYLON) -> (->

  Object.assign this,
    shapes: require("./helpers/shapes.coffee").load(BABYLON)

  @DOM =
    get_canvas: (selector) ->
      $(selector)[0]

  @Engine = 
    create: (canvas) ->
      new BABYLON.Engine canvas, true
    auto_resize: (engine) ->
      $(window).on "resize", -> engine.resize()
    start_render_loop: (engine, scene, tick_callback) ->
      engine.runRenderLoop ->
        scene.render()
        tick_callback() if tick_callback
      
  @Scene = 
    create: (engine) ->
      new BABYLON.Scene engine
    set_background_color: (scene, color) ->
      scene.clearColor = color
      
  @Camera = 
    create: (name, vector, scene) ->
      new BABYLON.FreeCamera name, vector, scene
    set_target: (camera, vector) ->
      camera.setTarget vector
    attach_control: (camera, canvas) ->
      camera.attachControl canvas, false

  @Light = 
    create: (name, vector, scene) ->
      new BABYLON.HemisphericLight(name, vector, scene)
    set_intensity: (light, val) ->
      light.intensity = val
  
  @Colors = 
    green: new BABYLON.Color3(0, 1, 0)

  @Vectors =
    new: (x, y, z) ->
      new BABYLON.Vector3 x, y, z
    y: new BABYLON.Vector3(0,1,0)
    zero: BABYLON.Vector3.Zero()

  this

).apply {}