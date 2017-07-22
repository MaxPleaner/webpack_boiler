Helpers = module.exports = load: (BABYLON) -> (->

  # TODOS:
  # VolumetricLightScatteringPostProcess

  @Shapes       = require("./helpers/shapes.coffee"     ).load(BABYLON)
  @DOM          = require("./helpers/dom.coffee"        ).load(BABYLON)
  @Engine       = require("./helpers/engine.coffee"     ).load(BABYLON)
  @Scene        = require("./helpers/scene.coffee"      ).load(BABYLON)
  @Camera       = require("./helpers/camera.coffee"     ).load(BABYLON)
  @Colors       = require("./helpers/colors.coffee"     ).load(BABYLON)
  @Light        = require("./helpers/light.coffee"      ).load(BABYLON)
  @Vectors      = require("./helpers/vectors.coffee"    ).load(BABYLON)
  @Animation    = require("./helpers/animation.coffee"  ).load(BABYLON)
  @Particles    = require("./helpers/particles.coffee"  ).load(BABYLON)
  @Sprites      = require("./helpers/sprites.coffee"    ).load(BABYLON)
  @Collisions   = require("./helpers/collisions.coffee" ).load(BABYLON)
  @Materials    = require("./helpers/materials.coffee"  ).load(BABYLON)
  @Events       = require("./helpers/events.coffee"     ).load(BABYLON)

  this
).apply {}