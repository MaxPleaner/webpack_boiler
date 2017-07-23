module.exports = Physics = load: (BABYLON) -> (->

# -----------------------------------------------------------------------------
  # Both enable and set_impostor need to be run whenever
  # physics is added to an object
# -----------------------------------------------------------------------------

  @enable = (scene, gravity_vector) ->
    plugin = new BABYLON.CannonJSPlugin()
    scene.enablePhysics gravity_vector, plugin

  @set_impostor = (shape, type, {mass, restitution}, scene) ->
    shape.physicsImpostor = new BABYLON.PhysicsImpostor(
      shape,
      BABYLON.PhysicsImpostor["#{type}Impostor"],
      { mass, restitution },
      scene
    )

  this
).apply {}