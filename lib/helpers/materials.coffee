module.exports = Materials = load: (BABYLON) -> (->

  # More info: https://www.eternalcoding.com/?p=303
  # Free textures: http://3delyvisions.co/skf1.htm

  # Sets the color of a shape
  @color_shape = (shape, color, alpha, scene) =>
    material = @create_material scene
    @set_alpha(material, 1)
    @set_diffuse_color(material, color)
    @apply_material(shape, material)

  @create_material = (scene) ->
    new BABYLON.StandardMaterial null, scene

  @create_texture = (path, scene) ->
    new BABYLON.CubeTexture null, path, scene

  @apply_default_skybox = (scene, texture, scale, pbr=false) ->
    scene.createDefaultSkybox texture, pbr, scale

  @apply_material = (scene, material) ->
    scene.material = material

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