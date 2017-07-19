Helpers = module.exports = load: (BABYLON) -> (->

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
  
  @Shapes =
    set_position: (shape, direction, val) ->
      shape.position[direction] = val
    Torus: 
      create: (name, diameter, thickness, tessellation, scene, updatable, side_orientation) ->
        BABYLON.Mesh.CreateTorus name, diameter, thickness, tessellation, scene, updatable, side_orientation
    Cylinder: 
      create: (name, height, diam_top, diam_bottom, tessellation, height_subdivs, scene, updatable, side_orientation) ->
        BABYLON.Mesh.CreateCylinder name, height, diam_top, diam_bottom, tessellation, height_subdivs, scene, updatable, side_orientation
    Triangle: 
      create: (name, radius, scene, updatable, side_orientation) ->
        BABYLON.Mesh.CreateDisk name, radius, 3, scene, updatable, side_orientation
    Square: 
      create: (name, radius, scene, updatable, side_orientation) ->
        BABYLON.Mesh.CreateDisk name, radius, 4, scene, updatable, side_orientation
    Disc: 
      create: (name, radius, tessellation, scene, updatable, side_orientation) ->
        BABYLON.Mesh.CreateDisk name, radius, tessellation, scene, updatable, side_orientation
    Plane: 
      create: (name, size, scene, updatable, side_orientation) ->
        BABYLON.Mesh.CreatePlane name, size, scene, updatable, side_orientation
    Box:
      create: (name, size, scene, updatable, side_orientation) ->
        BABYLON.Mesh.CreateBox name, size, scene, updatable, side_orientation
    Sphere: 
      create: (name, subdivisions, size, scene, updatable, side_orientation) ->
        BABYLON.Mesh.CreateSphere name, subdivisions, size, scene, updatable, side_orientation
    Ground: 
      create: (name, width, depth, subdivisions, scene, updatable, side_orientation) ->
        BABYLON.Mesh.CreateGround name, width, depth, subdivisions, scene, updatable, side_orientation

  @Colors = 
    green: new BABYLON.Color3(0, 1, 0)

  @Vectors =
    new: (x, y, z) ->
      new BABYLON.Vector3 x, y, z
    y: new BABYLON.Vector3(0,1,0)
    zero: BABYLON.Vector3.Zero()

  this

).apply {}