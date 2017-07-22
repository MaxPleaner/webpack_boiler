module.exports = DOM = load: (BABYLON) -> (->
  @get_canvas = (selector) ->
    $(selector)[0]
  this
).apply {}
