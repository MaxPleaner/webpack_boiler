module.exports = Collisions = load: (BABYLON) -> (->

  @intersects_with_mesh = (obj, mesh, precision=false) ->
    obj.intersectsMesh(mesh, precision)

  @intersects_with_point = (obj, vector, precision=false) ->
    obj.intersectsPoint(vector, precision)

  this
).apply {}