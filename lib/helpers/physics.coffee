module.exports = Physics = load: (BABYLON) -> (->

# -----------------------------------------------------------------------------
  # Both enable and set_impostor need to be run whenever
  # physics is added to an object
# -----------------------------------------------------------------------------

  @enable = (scene, gravity_vector) =>
    plugin = new BABYLON.CannonJSPlugin()
    scene.enablePhysics gravity_vector, plugin
    this

  @set_impostor = (shape, type, {mass, restitution}, scene) =>
    imposter = new BABYLON.PhysicsImpostor(
      shape,
      BABYLON.PhysicsImpostor["#{type}Impostor"],
      { mass, restitution },
      scene
    )
    shape.physicsImpostor = imposter
    imposter

  @apply_impulse = (imposter, direction_vector, impact_vector) =>
    imposter.applyImpulse direction_vector, impact_vector

  @update_linear_velocity = (imposter, x,y,z) =>
    vel = imposter.getLinearVelocity()
    imposter.setLinearVelocity(new BABYLON.Vector3
      (vel.x + x),
      (vel.y + y),
      (vel.z + z)
    )
    this

  @Linear = (=>
    move_up: (imposter, amount) =>
      @update_linear_velocity imposter, 0, 0, amount
    move_left: (imposter, amount) =>
      @update_linear_velocity imposter, -amount, 0, 0
    move_right: (imposter, amount) =>
      @update_linear_velocity imposter, amount, 0, 0
    move_down: (imposter, amount) =>
      @update_linear_velocity imposter, 0, 0, -amount
  )()


  this
).apply {}