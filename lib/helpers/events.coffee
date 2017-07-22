
module.exports = Events = load: (BABYLON) -> (->

  # see here for more stuff
  # https://doc.babylonjs.com/tutorials/picking_collisions


  @add_click_listener = (node=window, fn) ->
    node.addEventListener "click", fn

  # returns pick_result
  # with keys hit, distance, pickedMesh, and pickedPoint
  @find_clicked_element = (scene) ->
    scene.pick scene.pointerX, scene.pointerY

  this
).apply {}