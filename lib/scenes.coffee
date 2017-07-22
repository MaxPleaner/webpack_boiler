module.exports = Scenes = load: (BABYLON, game) -> (->

  @Tunnel = require("./scenes/tunnel.coffee").load(BABYLON, game)

  this
).apply {}