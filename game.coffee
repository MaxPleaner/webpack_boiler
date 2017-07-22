Game = module.exports = load: (BABYLON) -> (->

  Object.assign this,
    require('./lib/helpers.coffee').load(BABYLON)

  @init = (tick_callback) =>
    
    # game components
    @canvas = @DOM.get_canvas "#game-wrapper"
    @engine = @Engine.create @canvas
    @scene = @Scene.create @engine
    @camera = @Camera.free_camera @Vectors.new(0, 5, -10), @scene
    @light = @Light.create "Hemispheric", @Vectors.top_down(), @scene

    # Shapes
    @sphere = @Shapes.Sphere.create 16, 2, @scene
    @Shapes.set_position @sphere, 'y', 1
    @ground = @Shapes.Ground.create 6, 6, 2, @scene

    # initial setup
    @Light.set_intensity @light, 0.5
    @Camera.attach_control @camera, @canvas
    @Camera.set_target @camera, @Vectors.zero()
    @Scene.set_background_color @scene, @Colors.green
    @Engine.auto_resize @engine
    @Engine.start_render_loop @engine, @scene

    this

  this

).apply {}
