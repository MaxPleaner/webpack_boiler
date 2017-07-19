Game = module.exports = load: (BABYLON) -> (->

  Object.assign this,
    require('./lib/helpers.coffee').load(BABYLON)

  @init = (tick_callback) =>
    
    # configurable constants
    @canvas_selector = "#game-wrapper"
    @camera_vector = @Vectors.new(0, 5, -10)

    # game components
    @canvas = @DOM.get_canvas @canvas_selector
    @engine = @Engine.create @canvas
    @scene = @Scene.create @engine
    @camera = @Camera.create "camera", @camera_vector, @scene
    @light = @Light.create "light", @Vectors.y, @scene

    # Shapes
    @sphere = @Shapes.Sphere.create "sphere", 16, 2, @scene
    @Shapes.set_position @sphere, 'y', 1
    @ground = @Shapes.Ground.create "ground", 6, 6, 2, @scene

    # initial setup
    @Light.set_intensity @light, 0.5
    @Camera.attach_control @camera, @canvas
    @Camera.set_target @camera, @Vectors.zero
    @Scene.set_background_color @scene, @Colors.green
    @Engine.auto_resize @engine
    @Engine.start_render_loop @engine, @scene

    this

  this

).apply {}
