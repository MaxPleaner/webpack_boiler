module.exports = Particles = load: (BABYLON) -> (->

  # TODO:
  # startDirectionFunction
  # startPositionFunction
  # updateFunction

  # returns particle_system
  @create_particle_system = (max_num, scene, shader=null) ->
    new BABYLON.ParticleSystem null, max_num, scene, shader

  @apply_particle_system = (particle_system, obj) ->
    particle_system.emitter = obj

  @set_particle_texture = (particle_system, path, scene) ->
    particle_system.particleTexture = new BABYLON.Texture(path, scene)

  @set_texture_mask = (particle_system, r, g, b, a) ->
    particle_system.textureMask = new BABYLON.Color4(r,g,b,a)

  @set_colors = (particle_system, color1, color2, color_dead) ->
    particle_system.color1 = color1
    particle_system.color2 = color2
    particle_system.colorDead = color_dead

  @set_size = (particle_system, min, max) ->
    particle_system.minSize = min
    particle_system.maxSize = max

  @set_lifetime = (particle_system, min, max) ->
    particle_system.minLifeTime = min
    particle_system.maxLifeTime = max

  @set_emit_rate = (particle_system, value) ->
    particle_system.emitRate = value

  @set_manual_emit_count = (particle_system, value) ->
    particle_system.manualEmitCount = value

  # mode is one of:
  # 1. BABYLON.ParticleSystem.BLENDMODE_ONEONE (
  #    - default choice; source color added to dest; no alpha
  # 2. BABYLON.ParticleSystem.BLENDMODE_STANDARD
  #    - blend using particle's alpha
  @set_blend_mode = (particle_system, mode) ->
    particle_system.blendMode = mode

  @set_emitter_bounds = (particle_system, min_vector, max_vector) ->
    particle_system.minEmitBox = min_vector
    particle_system.maxEmitBox = max_vector

  this
).apply {}