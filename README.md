atom-bottom-dock
==================

[atom-bottom-dock](https://www.npmjs.com/package/atom-bottom-dock) is an npm helper module that you can use to create panes for the [bottom-dock](https://atom.io/packages/bottom-dock) atom package

##### API

```js
class DockPaneView extends View {
  initialize(): void
  setActive(active: boolean): void
  isActive(): boolean
  getId(): string
  refresh(): void
  destroy(): void
}
```

```js
class TabButton extends View {
  initialize(config): void // config: { id: string, active: boolean } where id comes from your pane's id
  isActive(): boolean
  getId(): string
  onDidClick(callback): Disposable
  destroy(): void
}
```

##### How to use
Extend the DockPaneView and TabButton to create a new pane type for the bottom-dock package.

If you don't want a custom tabButton you can use the prepackaged basicTabButton like so:

```coffee
{BasicTabButton} = require('atom-bottom-dock')

config =
  name: 'Example'
  active: yourPaneHere.isActive()
  id: yourPaneHere.getId()

var newTab = new BasicTabButton(config)
```
