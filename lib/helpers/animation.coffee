module.exports = Animation = load: (BABYLON) -> (->
  
  # TODO:
  # see https://doc.babylonjs.com/tutorials/animations
  # - enableBlending
  # - easing functions / EasingMode
  # - animation events
  # - hooking into animator event loop

  # property is an attribute of the mesh, and a direction
  # e.g. "scaling.x"

  # type is one of:
  # BABYLON.Animation.ANIMATIONTYPE_FLOAT
  # BABYLON.Animation.ANIMATIONTYPE_VECTOR2
  # BABYLON.Animation.ANIMATIONTYPE_VECTOR3
  # BABYLON.Animation.ANIMATIONTYPE_QUATERNION
  # BABYLON.Animation.ANIMATIONTYPE_MATRIX
  # BABYLON.Animation.ANIMATIONTYPE_COLOR3

  # end_state is one of:
  # BABYLON.Animation.ANIMATIONLOOPMODE_RELATIVE (Use previous values and increment it)
  # BABYLON.Animation.ANIMATIONLOOPMODE_CYCLE (Restart from initial value)
  # BABYLON.Animation.ANIMATIONLOOPMODE_CONSTANT (Keep their final value)

  @create = (property, fps, type, end_state) ->
    new BABYLON.Animation null, property, fps, type, end_state

  @connect_animation = (box, animation) ->
    box.animations ||= []
    box.animations.push animation

  # returns active_animation
  @start_animation = (scene, box, from_fps, to_fps, should_loop=null, speed_ratio=null) ->
    scene.beginAnimation box, from_fps, to_fps, should_loop, speed_ratio

  @fetch_active_animation = (scene, obj) ->
    scene.getAnimatableByTarget obj

  @pause = (active_animation) ->
    active_animation.pause()

  @build_key = (frame, value, in_tangent=null, out_tangent=null) ->
    {frame, value, in_tangent, out_tangent}

  @set_keys = (animation, keys) ->
    animation.setKeys keys

    

).apply {}