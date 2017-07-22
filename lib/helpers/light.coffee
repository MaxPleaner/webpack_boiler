module.exports = Light = load: (BABYLON) -> (->
  
  @create = (type, args...) ->
    new BABYLON["#{type}Light"](args...)

  @directional_light = (vector, scene) =>
    @create "Directional", null, vector, scene

  @point_light = (vector, scene) =>
    @create('Point', null, vector, scene)
  
  @hemispheric_light = (vector, scene) =>
    @create('Hemispheric', null, vector, scene)
  
  @spot_light = (position, direction, angle, exponent) =>
    @create "Spot", null, direction, angle, exponent

  @set_intensity = (light, val) ->
    light.intensity = val

  @set_diffuse = (light, color) ->
    light.diffuse = color

  @set_specular = (light, color) ->
    light.specular = color

  @set_ground_color = (light, color) ->
    light.groundColor = color

  @set_range = (light, range) ->
    light.range = range

  # increase the number of lights a material can receive
  # overrides default value of 4
  @set_num_simultaneous_lights = (material, num) ->
    material.maxsimultaneousLights = num

  @enable = (light) ->
    light.setEnabled true

  @disable = (light) ->
    light.setEnabled false

  this
).apply {}
