The vscode config I'm using right now.

#### Depends on
- [`drcika.apc-extension`](https://marketplace.visualstudio.com/items?itemName=drcika.apc-extension)
- [Dank Mono font](https://philpl.gumroad.com/l/dank-mono)
- Or alternatively the font [Hermit Font](https://pcaro.es/hermit/)

```json
{
  "editor.cursorSmoothCaretAnimation": "on",
  "workbench.colorTheme": "Hibiscus",
  "editor.fontFamily": "Dank Mono,Hermit",
  "editor.fontSize": 14,
  "breadcrumbs.enabled": false,
  "editor.cursorBlinking": "phase",
  "workbench.sideBar.location": "right",
  "workbench.activityBar.visible": false,
  "editor.minimap.enabled": false,
  "terminal.integrated.shellIntegration.decorationsEnabled": "never",
  "workbench.startupEditor": "none",
  "editor.lineNumbers": "off",
  "terminal.integrated.fontFamily": "Hermit",
  "terminal.integrated.fontSize": 13,
  "editor.fontWeight": "600",
  "editor.formatOnSave": true,
  "errorLens.enabled": false,
  "[javascript]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "snipped.disableTitle": true,
  "snipped.enablePng": true,
  "snipped.scale": 3,
  "update.showReleaseNotes": false,
  "[typescript]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "apc.statusBar": {
    "position": "editor-bottom",
    "height": 22,
    "fontSize": 10
  },
  "apc.electron": {
    "titleBarStyle": "hiddenInset",
    "trafficLightPosition": {
      "x": 8,
      "y": 10
    }
  },
  "apc.header": {
    "height": 34,
    "fontSize": 10
  },
  "apc.listRow": {
    "height": 24,
    "fontSize": 10
  },
  "[javascriptreact]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "window.titleBarStyle": "native",
  "window.zoomLevel": 0.5
}
```
