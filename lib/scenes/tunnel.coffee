
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
    @camera = @Camera.free_camera @Vectors.new(0, 5, -10), @scene
    this

  @build_light = =>
    @light = @Light.create "Hemispheric", @Vectors.top_down(), @scene
    this

  @add_shapes = =>
    @sphere = @Shapes.Sphere.create 16, 2, @scene
    @ground = @Shapes.Ground.create 6, 6, 2, @scene
    this

  @configure = =>
    @Camera.deactivate_panning @scene
    @Shapes.set_position @sphere, 'y', 1
    @Light.set_intensity @light, 0.5
    @Camera.attach_control @camera, @canvas
    @Camera.detach_control @camera, @canvas
    @Camera.set_target @camera, @Vectors.zero()
    @Scene.set_background_color @scene, @Colors.green
    @Engine.auto_resize @engine    
    this
    
  this
).apply {}
