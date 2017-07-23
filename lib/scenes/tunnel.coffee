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
    @Physics.enable(@scene, @Vectors.earth_gravity())
    @Scene.set_background_color @scene, @Colors.black()
    this

  @build_camera = =>
    @camera = @Camera.free_camera @Vectors.new(0, 5, -20), @scene
    # @Camera.attach_control @camera, @canvas  
    # @Camera.set_target @camera, @Vectors.new(0,0,0)
    # @Camera.configure_follow_camera @camera,
    #   radius: 6,
    #   height_offset: 10
    this

  @build_light = =>
    @light = @Light.spot_light @Vectors.new(0,100,0), @Vectors.top_down(), 0.8, 2, @scene
    @light.intensity = 0.5
    this

  @add_ground = =>
    @ground = @Shapes.Ground.create 50, 50, 0, @scene
    @ground_material = @Materials.create_material @scene
    @ground_material.diffuseTexture = @Materials.create_texture "./textures/ground.jpg", @scene
    @ground_material.diffuseTexture.uScale = 4
    @ground_material.diffuseTexture.vScale = 4
    @Materials.apply_material @ground, @ground_material
    @Physics.set_impostor @ground,
      "Box", { mass: 0, restitution: 0.9 }, @scene
    this

  @add_water = =>
    @water = @Shapes.Ground.create 50, 30, 0, @scene, false
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
    @Physics.set_impostor @water,
      "Box", { mass: 0, restitution: 0 }, @scene
    @Materials.apply_material @water, @water_material
    @Materials.add_to_render_list @water_material, @ground
    this

  @add_player = =>
    @player = @Shapes.Sphere.create(2,1.5,@scene)
    @Shapes.set_position @player, 'y', 20
    @player_imposter = @Physics.set_impostor @player,
      "Sphere", { mass: 1, restitution: 0.9 }, @scene
    movement_speed = 0.1
    # rotation_speed = 15
    # @Camera.configure_follow_camera @camera, { target: @player }
    $(window).on "keydown", (e) =>
      code = e.keyCode
      console.log code
      if code == 87 # 'w'
        null
      else if code == 65 # 'a'
        null
      else if code == 68 # 'd'
        null
      else if code == 83 # 's'
        null
      else if code == 37  # left arrow
        @Physics.apply_impulse(
          @player_imposter,
          @Vectors.new(-movement_speed, 0, 0),
          @player.getAbsolutePosition()
        )
        # @Physics.Linear.move_left(@player_imposter, movement_speed)
      else if code == 38 # up arrow
        @Physics.apply_impulse(
          @player_imposter,
          @Vectors.new(0, 0, movement_speed),
          @player.getAbsolutePosition()
        )
        # @Physics.Linear.move_up(@player_imposter, movement_speed)
      else if code == 39 # right arrow
        @Physics.apply_impulse(
          @player_imposter,
          @Vectors.new(movement_speed, 0, 0),
          @player.getAbsolutePosition()
        )
        # @Physics.Linear.move_right(@player_imposter, movement_speed)
      else if code == 40 # down arrow
        @Physics.apply_impulse(
          @player_imposter,
          @Vectors.new(0, 0, -movement_speed),
          @player.getAbsolutePosition()
        )
        # @Physics.Linear.move_down(@player_imposter, movement_speed)

    
  this
).apply {}
