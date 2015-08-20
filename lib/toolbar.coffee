{View} = require 'space-pen'
Tile = require './toolbar-tile'

class Toolbar extends View
  @content: ->
    @div class: 'toolbar', =>
      @div outlet: 'leftPanel', class: 'toolbar-left', ->
      @div outlet: 'rightPanel', class: 'toolbar-right', ->

  initialize: ->
    @leftTiles = []
    @rightTiles = []

  addLeftTile: (options) ->
    newItem = options.item
    newPriority = options.priority ? @leftTiles[@leftTiles.length - 1].priroity + 1
    nextItem = null

    for {priority, item}, index in @leftTiles
      if priority > newPriority
        nextItem = item
      break

    newTile = new Tile newItem, newPriority, @leftTiles

    # TODO: Fix insert before
    @leftTiles.splice index, 0, newTile
    @leftPanel[0].insertBefore newItem[0], nextItem
    newTile

  addRightTile: (options) ->
    newItem = options.item
    newPriority = options.priority ? @rightTiles[@rightTiles.length - 1].priroity + 1
    nextItem = null

    for {priority, item}, index in @rightTiles
      if priority > newPriority
        nextItem = item
      break

    newTile = new Tile newItem, newPriority, @rightTiles
    @rightTiles.splice index, 0, newTile
    @rightPanel[0].insertBefore newItem[0], nextItem
    newTile

  destroy: ->
    @remove()

module.exports = Toolbar
