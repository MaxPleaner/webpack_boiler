Shapes = module.exports = load: (BABYLON) -> (->

  @set_position: (shape, direction, val) ->
    shape.position[direction] = val

  # TODO (see https://doc.babylonjs.com/tutorials/discover_basic_elements):
  # - Polygon
  # - Polygon extrusion
  # - Lines Mesh
  # - DashedLines Mesh
  # - Ribbon
  # - Tube
  # - TiledGround

  # Note the following valid values for 'side_orientation':
  # - BABYLON.Mesh.FRONTSIDE,
  # - BABYLON.Mesh.BACKSIDE,
  # - BABYLON.Mesh.DOUBLESIDE,
  # - BABYLON.Mesh.DEFAULT which is the default value and equals FRONTSIDE currently.

  @Knot =
    create: (name, radius, tube, radial_segments, tubular_segments, p, q scene, updatable, side_orientation) ->
      BABYLON.Mesh.CreateKnot name, radius, tube, radial_segments, tubular_segments, p, q scene, updatable, side_orientation
  
  @Torus =
    create: (name, diameter, thickness, tessellation, scene, updatable, side_orientation) ->
      BABYLON.Mesh.CreateTorus name, diameter, thickness, tessellation, scene, updatable, side_orientation

  @Cylinder =
    create: (name, height, diam_top, diam_bottom, tessellation, height_subdivs, scene, updatable, side_orientation) ->
      BABYLON.Mesh.CreateCylinder name, height, diam_top, diam_bottom, tessellation, height_subdivs, scene, updatable, side_orientation

  @Triangle =
    create: (name, radius, scene, updatable, side_orientation) ->
      BABYLON.Mesh.CreateDisk name, radius, 3, scene, updatable, side_orientation

  @Square =
    create: (name, radius, scene, updatable, side_orientation) ->
      BABYLON.Mesh.CreateDisk name, radius, 4, scene, updatable, side_orientation

  @Disc =
    create: (name, radius, tessellation, scene, updatable, side_orientation) ->
      BABYLON.Mesh.CreateDisk name, radius, tessellation, scene, updatable, side_orientation

  @Plane =
    create: (name, size, scene, updatable, side_orientation) ->
      BABYLON.Mesh.CreatePlane name, size, scene, updatable, side_orientation

  @Box =
    create: (name, size, scene, updatable, side_orientation) ->
      BABYLON.Mesh.CreateBox name, size, scene, updatable, side_orientation

  @Sphere =
    create: (name, subdivisions, size, scene, updatable, side_orientation) ->
      BABYLON.Mesh.CreateSphere name, subdivisions, size, scene, updatable, side_orientation

  @Ground =
    create: (name, width, depth, subdivisions, scene, updatable, side_orientation) ->
      BABYLON.Mesh.CreateGround name, width, depth, subdivisions, scene, updatable, side_orientation
    from_height_map: (name, heightmapPath, width, depth, subdivs, minheight, maxheight, scene, updatable, successCallback) ->
      BABYLON.Mesh.CreateGroundFromHeightMap name, heightmapPath, width, depth, subdivs, minheight, maxheight, scene, updatable, successCallback

  this
).apply {}