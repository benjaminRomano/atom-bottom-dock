{View, $} = require 'space-pen'
window.jQuery = $
require 'tablesorter'

class SortableTable extends View
  @content: (config) ->
    @div class: 'table-container', =>
      @table outlet: 'table', class: 'tablesorter tablesorter-atom resizable-table', =>
        @thead outlet: 'headers', =>
          if config?.headers
            @th header for header in config.headers
        @tbody outlet: 'body'

  initialize: (config) ->
    # Hack to include tablesorter jquery extension
    @table = $(@table)
    @body = $(@body)

    @table.tablesorter
      theme: 'atom'
      widgets: ['zebra', 'stickyHeaders','resizable']
      widgetOptions:
        resizable: true
        stickyHeaders_attachTo: @

module.exports = SortableTable
