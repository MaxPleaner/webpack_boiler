module.exports = Sprites = load: (BABYLON) -> (->

  @create_sprite_manager = (path, capacity, cell_size, scene) ->
    new BABYLON.SpriteManager null, path, capacity, cell_size, scene

  @create_sprite = (manager) ->
    new BABYLON.Sprite null, manager

  @set_position = (sprite, direction, value) ->
    sprite.position[direction] = value

  @play_animation = (sprite, start, end, should_loop, delay) ->
    sprite.playAnimation sprite, start, end, should_loop, delay

  @change_active_frame = (sprite, value) ->
    sprite.cellIndex = value

  @set_size = (sprite, value) ->
    sprite.size = value

  @set_angle = (sprite, value) ->
    sprite.angle = value

  @set_invert_u = (sprite, value) ->
    sprite.invertU = value

  @set_width = (sprite, value) ->
    sprite.width = value

  @set_height = (sprite, value) ->
    sprite.height = value

  this

).apply {}