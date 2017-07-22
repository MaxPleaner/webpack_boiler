module.exports = Materials = load: (BABYLON) -> (->

  # More info: https://www.eternalcoding.com/?p=303
  # Free textures: http://3delyvisions.co/skf1.htm

  # Sets the color of a shape
  @color_shape = (shape, color, alpha, scene) =>
    material = @create_material scene
    @set_alpha(material, 1)
    @set_diffuse_color(material, color)
    @apply_material(shape, material)

  # returns water_material object
  @create_water_material = (scene) ->
    new BABYLON.WaterMaterial null, scene

  @set_bump_texture = (texture_path, water_material, scene) ->
    water_material.bumpTexture = new BABYLON.Texture texture_path, scene

  @set_water_properties = (
      water_material,
      {
        wind_force, wave_height, wind_direction, water_color, color_blend_factor,
        bump_height, wave_length
      }
  ) ->
    Object.assign water_material, {
      wind_force, wave_height, wind_direction, water_color, color_blend_factor,
      bump_height, wave_length
    }

  @add_to_render_list = (source, target) ->
    source.addToRenderList target

  @activate_textures = (material) ->

  @create_material = (scene) ->
    new BABYLON.StandardMaterial null, scene

  @create_texture = (path, scene, type='', args...) ->
    new BABYLON["#{type}Texture"] path, scene, args...

  @create_cube_texture = (path, scene) =>
    @create_texture "Cube", path, scene

  @apply_default_skybox = (scene, texture, scale, pbr=false) ->
    scene.createDefaultSkybox texture, pbr, scale

  @apply_material = (obj, material) ->
    obj.material = material

  @apply_texture = (material, texture, coordinates_mode) ->
    material.reflectionTexture = texture
    material.reflectionTexture.coordinatesMode = coordinates_mode

  @set_infinite_distance = (scene, value) ->
    scene.infiniteDistance = value

  @set_backface_culling = (material, value) ->
    material.backFaceCulling = value

  @set_lighting_enabled = (material, value) ->
    material.disableLighting = !value

  @set_alpha = (material, value) ->
    material.alpha = value

  @set_diffuse_color = (material, color) ->
    material.diffuseColor = color

  # group_id is akin to z-index
  @set_group_id = (obj, value) ->
    obj.renderingGroupId = value

  this
).apply {}