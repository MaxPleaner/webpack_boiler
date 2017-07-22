Shapes = module.exports = load: (BABYLON) -> (->

  @create_shape = (type, args...) ->
    BABYLON.Mesh["Create#{type}"](args...)

  @set_position = (shape, direction, val) ->
    shape.position[direction] = val

  # TODO (see https://doc.babylonjs.com/tutorials/discover_basic_elements):
  # - Polygon
  # - Polygon extrusion
  # - Lines Mesh
  # - DashedLines Mesh
  # - Ribbon
  # - Tube
  # - TiledGround

  # the 'opts' params are two sequential values: 'updatable' (bool) and
  # 'side_orientiation' (one of the following values:)
  # - BABYLON.Mesh.FRONTSIDE,
  # - BABYLON.Mesh.BACKSIDE,
  # - BABYLON.Mesh.DOUBLESIDE,
  # - BABYLON.Mesh.DEFAULT which is the default value and equals FRONTSIDE currently.

  @Knot =
    create: (radius, tube, radial_segments, tubular_segments, p, q, scene, opts...) =>
      @create_shape 'Knot', null, radius, tube, radial_segments, tubular_segments, p, q scene, opts...
  
  @Torus =
    create: (diameter, thickness, tessellation, scene, opts...) =>
      @create_shape 'Torus', null, diameter, thickness, tessellation, scene, opts...

  @Cylinder =
    create: (height, diam_top, diam_bottom, tessellation, height_subdivs, scene, opts...) =>
      @create_shape 'Cylinder', null, height, diam_top, diam_bottom, tessellation, height_subdivs, scene, opts...

  @Triangle =
    create: (radius, scene, opts...) =>
      @create_shape 'Disk', null, radius, 3, scene, opts...

  @Square =
    create: (radius, scene, opts...) =>
      @create_shape 'Disk', null, radius, 4, scene, opts...

  @Disc =
    create: (radius, tessellation, scene, opts...) =>
      @create_shape 'Disk', null, radius, tessellation, scene, opts...

  @Plane =
    create: (size, scene, opts...) =>
      @create_shape 'Plane', null, size, scene, opts...

  @Box =
    create: (size, scene, opts...) =>
      @create_shape 'Box', null, size, scene, opts...

  @Sphere =
    create: (subdivisions, size, scene, opts...) =>
      @create_shape 'Sphere', null, subdivisions, size, scene, opts...

  @Ground =
    create: (width, depth, subdivisions, scene, can_be_regenerated, mesh) =>
      @create_shape 'Ground', null, width, depth, subdivisions, scene, can_be_regenerated, mesh
    from_height_map: (heightmapPath, width, depth, subdivs, minheight, maxheight, scene, updatable, successCallback) =>
      @create_shape 'GroundFromHeightMap', null, heightmapPath, width, depth, subdivs, minheight, maxheight, scene, updatable, successCallback

  this
).apply {}