
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
    @scene = @Scene.create @engine
    @build_camera()
    @build_light()
    @add_shapes()
    @configure()
    this

  @build_camera = =>
    @camera = @Camera.free_camera @Vectors.new(0, 10, -20), @scene
    this

  @build_light = =>
    @light = @Light.spot_light @Vectors.new(0,100,0), @Vectors.top_down(), 0.8, 2, @scene
    this

  @add_shapes = =>
    @sphere = @Shapes.Sphere.create 16, 2, @scene
    @ground = @Shapes.Ground.create 100, 100, 3, @scene
    this

  @configure = =>
    @Scene.set_background_color @scene, @Colors.black
    @light.intensity = 0.5
    @Camera.deactivate_panning @scene
    @Shapes.set_position @sphere, 'y', 1
    @Materials.color_shape @sphere, @Colors.red, 1, @scene
    @Materials.color_shape @ground, @Colors.red, 1, @scene
    @Camera.set_target @camera, @Vectors.new(0,0,0)
    @Engine.auto_resize @engine
    this
    
  this
).apply {}
