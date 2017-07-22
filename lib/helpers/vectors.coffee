module.exports = Vectors = load: (BABYLON) -> (->
  @new = (x, y, z) ->
    new BABYLON.Vector3 x, y, z
  @top_down = =>
    @new 0, -1, 0
  @bottom_up = =>
    @new 0, 1, 0
  @to_right = =>
    @new 1, 0, 0
  @to_left = =>
    @new -1, 0, 0
  @to_center = =>
    @new 0, 0, -1
  @from_center = =>
    @new 0, 0, 1
  @zero = ->
    BABYLON.Vector3.Zero()
  this
).apply {}
