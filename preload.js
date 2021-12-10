const { contextBridge, ipcRenderer } = require('electron')

// Set up context bridge between the renderer process and the main process
contextBridge.exposeInMainWorld(
  'shell',
  {
    open: () => ipcRenderer.send('shell:open'),
    open_vss: () => ipcRenderer.send('shell:open_vss'),
    choose_file: () => ipcRenderer.send('shell:choose_file'),
    write_code: () => ipcRenderer.send('shell:write_code'),
    run_code: () => ipcRenderer.send('shell:run_code'),
    quit: () => ipcRenderer.send('shell:quit'),
  }
)