module.exports = Light = load: (BABYLON) -> (->
  
  # generic constructor for a light
  @create = (type, args...) ->
    new BABYLON["#{type}Light"](args...)

  # construtor for a directional light
  # (from everywhere, converging on a single spot, with infinite range)
  @directional_light = (target_position, scene) =>
    @create "Directional", null, target_position, scene

  # constructor for a point light, e.g. the sun
  @point_light = (position, scene) =>
    @create('Point', null, position, scene)
  
  # constructor for a hemispheric light, e.g. ambient light
  @hemispheric_light = (position, scene) =>
    @create('Hemispheric', null, position, scene)
  
  # constructor for a spotlight
  # angle (radians) and exponent concern the size of the spotlight's opening
  @spot_light = (position, direction, angle, exponent, scene) =>
    @create "Spot", null, position, direction, angle, exponent, scene

  # set the volume of a light's output
  @set_intensity = (light, val) ->
    light.intensity = val

  # set the diffuse color of the light
  @set_diffuse = (light, color) ->
    light.diffuse = color

  # set the position of the light
  @set_position = (light, vector) ->
    light.position = vector

  # set the specular color of the light
  @set_specular = (light, color) ->
    light.specular = color

  # set the ground color of the light
  @set_ground_color = (light, color) ->
    light.groundColor = color

  # set the distance the light travels
  @set_range = (light, range) ->
    light.range = range

  # increase the number of lights a material can receive
  # overrides default value of 4
  @set_num_simultaneous_lights = (material, num) ->
    material.maxsimultaneousLights = num

  # turn on a light
  @enable = (light) ->
    light.setEnabled true

  # turn off a light
  @disable = (light) ->
    light.setEnabled false

  this
).apply {}
