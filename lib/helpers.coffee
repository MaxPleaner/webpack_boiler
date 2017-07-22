Helpers = module.exports = load: (BABYLON) -> (->
  @Shapes = require("./helpers/shapes.coffee" ).load(BABYLON)
  @DOM    = require("./helpers/dom.coffee"    ).load(BABYLON)
  @Engine = require("./helpers/engine.coffee" ).load(BABYLON)
  @Scene  = require("./helpers/scene.coffee"  ).load(BABYLON)
  @Camera = require("./helpers/camera.coffee" ).load(BABYLON)
  @Colors = require("./helpers/colors.coffee" ).load(BABYLON)
  @Light = require("./helpers/light.coffee" ).load(BABYLON)
  @Vectors = require("./helpers/vectors.coffee" ).load(BABYLON)
  this
).apply {}