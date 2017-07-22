module.exports = Light = load: (BABYLON) -> (->
  
  @point_light = (vector, scene) =>
    @create('Point', null, vector, scene)
  
  @hemispheric_light = (vector, scene) =>
    @create('Hemispheric', null, vector, scene)
  
  @create = (type, args...) ->
    new BABYLON["#{type}Light"](args...)
  
  @set_intensity = (light, val) ->
    light.intensity = val

  this
).apply {}
