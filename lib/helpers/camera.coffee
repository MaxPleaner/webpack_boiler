module.exports = Camera = load: (BABYLON) -> (->
  # TODO: Universal Camera

  # Generic constructor
  @create = (type, args...) ->
    new BABYLON["#{type}Camera"](args...)

  # constructor for camera on spherical axis
  @arc_rotate = (alpha, beta, radius, target, scene) =>
    @create 'ArcRotate', null, alpha, beta, radius, target, scene
  
  # constructor for free-travelling camera
  @free_camera = (position, scene) =>
    @create 'Free', null, position, scene

  # constructor for camera responding to touch events
  @touch_camera = (position, scene) =>
    @create 'Touch', null, position, scene

  # constructor for camera responding to gamepad events
  @gamepad_camera = (position, scene) =>
    @create 'Gamepad', null, position, scene

  # constructor for camera responding to DeviceOrientation events
  @device_orientation_camera = (position, scene) =>
    @create 'DeviceOrientation', null, position, scene

  # constructor for camera using virtual joystick
  @virtual_joysticks_camera = (position, scene) =>
    @create 'VirtualJoysticks', null, position, scene

  # constructor for free-position camera using VR
  @vr_device_orientation_free_camera = (position, scene) =>
    @create 'VRDeviceOrientation', null, position, scene

  # constructor for free-position camera using 3d glasses
  @anaglyph_free_camera = (alpha, beta, radius, target, eyespace, scene) =>
    @create 'AnaglyphFree', null, alpha, beta, radius, target, eyespace, scene

  # constructor for free-position camera using web VR
  @web_vr_free_camera = (alpha, beta, radius, target, eyespace, scene) =>
    @create 'WebVRFree', null, alpha, beta, radius, target, eyespace, scene

  # constructor for axis-rotating camera using 3d glasses
  @anaglyph_arc_rotate_camera = (position, scene) =>
    @create 'AnaglyphArcRotate', null, position, scene

  # constructor for camera which follows something
  @follow_camera = (position, scene) =>
    @create 'Follow', null, position, scene      

  # modify the orientation of the camera
  @set_target = (camera, vector) ->
    camera.setTarget vector

  # add a camera to the canvas
  @attach_control = (camera, canvas, prevent_default=true) ->
    camera.attachControl canvas, !prevent_default

  # set the camera position
  @set_position = (camera, vector) ->
    camera.setPosition vector

  # disallow manual panning for the camera
  @deactivate_panning = (scene) ->
    scene.activeCamera.panningSensibility = 0
    
  this
).apply {}

