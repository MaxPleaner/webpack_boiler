module.exports = Colors = load: (BABYLON) -> (->
  @gray = new BABYLON.Color3(0.2, 0.2, 0.2)
  @red = new BABYLON.Color3(0.5, 0, 0)
  @white = new BABYLON.Color3(1,1,1)
  this
).apply {}
