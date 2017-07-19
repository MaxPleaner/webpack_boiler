# BABYLON is expected to be defined as a global already

Game = require('./game.coffee').load(BABYLON)

window.$ = require 'jquery'

$layout_content = $ require "html-loader!./templates/layout.slim"
$root_content = $ require "html-loader!./templates/root.slim"

require './style.sass'

$ ->

  $layout_wrapper = $ "#layout-wrapper"
  $layout_wrapper.append($layout_content)

  $root_wrapper = $ "#root-wrapper"
  $root_wrapper.append($root_content)

  window.game = Game.init()