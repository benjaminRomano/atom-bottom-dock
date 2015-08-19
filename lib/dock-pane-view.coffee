{View} = require('space-pen')

class DockPaneView extends View
  initialize: ->
    @id = generateId()
    @setActive true

  setActive: (active) ->
    @active = active
    if @active then @show() else @hide()

  isActive: ->
    @active

  getId: ->
    @id.split('dock-pane-')[1]

  destroy: ->
    @remove()

  generateId = ->
    possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"

    text = ''
    for i in [0 .. 7]
      text += possible.charAt(Math.floor(Math.random() * possible.length))

    "dock-pane-#{text}"

module.exports = DockPaneView
