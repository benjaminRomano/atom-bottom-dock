atom-bottom-dock
==================

[atom-bottom-dock](https://www.npmjs.com/package/atom-bottom-dock) is an npm helper module that you can use to create panes for the [bottom-dock](https://atom.io/packages/bottom-dock) atom package

##### API

```js
class DockPaneView extends View {
  setActive(active: boolean): void
  isActive(): boolean
  getId(): string
  destroy(): void
}
```

```js
class FilterSelector extends View {
  constructor(config?): void // where config is { filterLabel?: string, activeFilter?: string, filters?: [{ value: string, label?: string }]}
  updateFilters(config): void // where config is the same as constructor param
  setFilter(filterName: string): void
  getFilter(): string
  onDidChangeFilter(callback): Disposable
  destroy(): void
}
```

```js
class SortableTable extends View {
  constructor(config): void // where config is { headers: string[] }
  JQueryElement body //JQuery is extended by tablesorter. Learn more [here](https://github.com/Mottie/tablesorter)
}
```

```js
class Toolbar extends View {
  addLeftTile(options): JQueryElement // where options is { item: JQueryElement, priority: int }
  addRightTile(options): JQueryElement // where options is { item: JQueryElement priority: int }
  destroy(): void
}
```

#### How to use
Extend the DockPaneView to create a new pane type for the bottom-dock package.

FilterSelector Example
```coffee
{FilterSelector} = require 'atom-bottom-dock'

config =
  activeFilter: 'filter1'
  label: 'Example Filter:'
  filters: [{
    value: 'filter1'
  }, {
    value: 'filter2'
    label: 'Filter2 Label'
  }]

filterSelector = new FilterSelector config

filterSelector.setActiveFilter 'filter2'
filterSelector.getActiveFilter() # 'filter2'
```

SortableTable Example
```coffee
{SortableTable} = require 'atom-bottom-dock'

table = new SortableTable headers: ['Header1', 'Header2']

row = $('<tr>
  <td>Data1</td>
  <td>Data2</td>
')

table.body.append row
table.body.trigger 'update' #Force resort
```

Toolbar Example
```coffee
{Toolbar} = require 'atom-bottom-dock'
toolbar = new Toolbar()

toolbar.addLeftTile item: $('button'), priority: 0
toolbar.addRightTile item: $('<span>Example</span>'), priority: 1
```
