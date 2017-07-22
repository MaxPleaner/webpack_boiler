module.exports = Tunnel = load: (BABYLON, game) -> (->

  # Imports some functionality from game, including everything in helpers/
  { @engine, @canvas } = game
  Object.assign this, game.Helpers

  # returns a scene which can passed to game.start
  @build = =>
    @configure_engine()
    @build_scene()
    @build_camera()
    @build_light()
    @add_ground()
    @add_water()
    @add_player()
    this

  @configure_engine = =>
    @Engine.auto_resize @engine
    this

  @build_scene = =>
    @scene = @Scene.create @engine
    @Scene.set_background_color @scene, @Colors.black()
    this

  @build_camera = =>
    @camera = @Camera.follow_camera @Vectors.new(0, 16, -45), @scene
    @Camera.set_target @camera, @Vectors.new(0,0,0)
    @Camera.configure_follow_camera @camera,
      radius: 5,
      height_offset: 5,
      rotation_offset: 5,
      camera_acceleration: 5,
      max_camera_speed: 5
    this

  @build_light = =>
    @light = @Light.spot_light @Vectors.new(0,100,0), @Vectors.top_down(), 0.8, 2, @scene
    @light.intensity = 0.5
    this

  @add_ground = =>
    @ground = @Shapes.Ground.create 100, 100, 3, @scene
    @ground_material = @Materials.create_material @scene
    @ground_material.diffuseTexture = @Materials.create_texture "./textures/ground.jpg", @scene
    @ground_material.diffuseTexture.uScale = 4
    @ground_material.diffuseTexture.vScale = 4
    @Materials.apply_material @ground, @ground_material
    this

  @add_water = =>
    @water = @Shapes.Ground.create 100, 100, 3, @scene, false
    @water_material = @Materials.create_water_material @scene
    @Materials.set_bump_texture "./textures/waterbump.png", @water_material, @scene
    @Materials.set_water_properties @water_material,
      wind_force: -15
      wave_height: 1.3
      wind_direction: @Vectors.new(1,1)
      water_color: @Colors.create(0.1, 0.1, 0.6)
      color_blend_factor: 0.3
      bump_height: 0.1
      wave_length: 0.1
    @Materials.apply_material @water, @water_material
    @Materials.add_to_render_list @water_material, @ground
    this

  @add_player = =>
    @player = @Shapes.Sphere.create(2,1.5,@scene)
    @Shapes.set_position @player, 'y', 2.5
    @Camera.configure_follow_camera @camera,
      target: @player

    
  this
).apply {}
