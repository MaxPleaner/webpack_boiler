
# -----------------------------------------------------------------------------
# Plot:
#   From the tourist center, the agent gets invited to scuba through a tunnel
#   It winds a few times, illuminated by some reddish bulbs on the ceiling.
#   The water is dark and foreboding.
#   At the end of the tunnel there is an open bay
# -----------------------------------------------------------------------------

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
    this

  @configure_engine = =>
    @Engine.auto_resize @engine
    this

  @build_scene = =>
    @scene = @Scene.create @engine
    @Scene.set_background_color @scene, @Colors.black()
    this

  @build_camera = =>
    @camera = @Camera.free_camera @Vectors.new(0, 10, -20), @scene
    @Camera.deactivate_panning @scene
    @Camera.set_target @camera, @Vectors.new(0,0,0)
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
    
  this
).apply {}
