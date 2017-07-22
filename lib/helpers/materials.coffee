module.exports = Materials = load: (BABYLON) -> (->

  # More info: https://www.eternalcoding.com/?p=303
  # Free textures: http://3delyvisions.co/skf1.htm

  @create_material = (scene) ->
    new BABYLON.StandardMaterial scene

  @create_texture = (path, scene) ->
    new BABYLON.CubeTexture path, scene

  @apply_default_skybox = (scene, texture, scale, pbr=false) ->
    scene.createDefaultSkybox texture, pbr, scale

  @apply_material = (scene, material) ->
    scene.material = material

  @apply_texture = (material, texture, coordinates_mode) ->
    material.reflectionTexture = texture
    materia.reflectionTexture.coordinatesMode = coordinates_mode

  @set_infinite_distance = (scene, value) ->
    scene.infiniteDistance = value

  @set_backface_culling = (material, value) ->
    material.backFaceCulling = value

  @set_lighting_enabled = (material, value) ->
    material.disableLighting = !value

  # group_id is akin to z-index
  @set_group_id = (obj, value) ->
    obj.renderingGroupId = value

  this
).apply {}