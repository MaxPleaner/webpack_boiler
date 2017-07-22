module.exports = Scene = load: (BABYLON) -> (->

  @create = (engine) ->
    new BABYLON.Scene engine

  @set_background_color = (scene, color) ->
    scene.clearColor = color

  @set_ambient_color = (scene, color) ->
    scene.ambientColor = color

  @set_camera = (scene, camera) ->
    scene.activeCamera = camera

  this
).apply {}

