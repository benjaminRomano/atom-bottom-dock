{View} = require('space-pen')

class DockPaneView extends View
  initialize: ->
    @canBeDeleted = true
    @id = @generateId()

  setActive: (active) ->
    @active = active
    if @active
      @show()
    else
      @hide()

  canBeDeleted: ->
    return true

  isActive: ->
    return @active

  getId: ->
    return @id.split('dock-pane-')[1]

  refresh: ->

  destroy: ->
    @remove()

  generateId: ->
    possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"

    text = ''
    for i in [0 .. 7]
      text += possible.charAt(Math.floor(Math.random() * possible.length))
    return 'dock-pane-' + text


module.exports = DockPaneView
