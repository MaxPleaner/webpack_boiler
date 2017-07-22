module.exports = Colors = load: (BABYLON) -> (->

  # generic constructor
  @create = (r,b,g) ->
    new BABYLON.Color3(0.2,0.2,0.2)

  @gray = =>
    @create(0.2, 0.2, 0.2)

  @black = =>
    @create(0, 0, 0)

  @red = =>
    @create(0.5, 0, 0)

  @white = =>
    @create(1,1,1)

  this
).apply {}
