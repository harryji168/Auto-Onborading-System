// Modules to control application life and create native browser window
 
const { app, BrowserWindow, ipcMain, shell, dialog } = require('electron')
const url = require('url')
const path = require('path')
const fetch = require('node-fetch')

let win

// Set the path where recordings will be saved
app.setPath("userData", __dirname + "/saved_recordings")



function createWindow (railsApp) {
  // Create the browser window.
  const mainWindow = new BrowserWindow({
    width: 300,
    height: 180,
    autoHideMenuBar:true , 
    alwaysOnTop:true,
    webPreferences: {
      preload: path.join(__dirname, 'preload.js')
    }
  })

  // and load the index.html of the app.
  mainWindow.loadURL('http://localhost:16888')

  win.close();
  // Open the DevTools.
  // mainWindow.webContents.openDevTools()

   // Emitted when the window is closed.
   mainWindow.on('closed', function() {
    railsApp.kill('SIGINT')
  })
}

// This method will be called when Electron has finished
// initialization and is ready to create browser windows.
// Some APIs can only be used after this event occurs.
app.whenReady().then(() => {



     // Create the window
win = new BrowserWindow({ width: 800,  height: 600,  
  autoHideMenuBar:true , alwaysOnTop:true, frame: true, transparent:false,
  webPreferences: {
    nodeIntegration: true,
    preload: path.join(__dirname, "preload.js")
  }
})

// Open and load index.html to the window
 win.loadURL('file://' + __dirname + '/index.html')

 /*
 // Spec: User can hide App window by clicking the button.
 ipcMain.on("hide-me", () => appWin.minimize());
  
 // Spec-start: When User focuses App window - it becomes fully opaque.
 ipcMain.on("make-window-opaque", () => appWin.setOpacity(1));
 appWin.on("show", () => minisWindow.setOpacity(1));
 appWin.on("blur", () => minisWindow.setOpacity(0.5));
 // Spec-end.

*/
// const { exec } = require("child_process");

/* exec("( speaker-test -t sine -f 1000 )& pid=$! ; sleep 0.1s ; kill -9 $pid", (error, stdout, stderr) => {
  if (error) {
      console.log(`error: ${error.message}`);
      return;
  }
  if (stderr) {
      console.log(`stderr: ${stderr}`);
      return;
  }
  console.log(`stdout: ${stdout}`);
})*/
/*
exec("xdotool move_test", (error, stdout, stderr) => {
    if (error) {
        console.log(`error: ${error.message}`);
        return;
    }
    if (stderr) {
        console.log(`stderr: ${stderr}`);
        return;
    }
    console.log(`stdout: ${stdout}`);
})
*/

 


const { exec } = require("child_process");
/*exec("play start_sound.mp3", (error, stdout, stderr) => {
    if (error) {
        console.log(`error: ${error.message}`);
        return;
    }
    if (stderr) {
        console.log(`stderr: ${stderr}`);
        return;
    }
    console.log(`stdout: ${stdout}`);
})*/

 
 /*
  const railsApp = require('child_process').spawn('rails', ['s'])

  console.log("starting rails server... waiting 5 seconds")

  async function start() {
    const res = await fetch('http://localhost:16888')
    console.log('rails server started')
    createWindow(railsApp)
    app.on('activate', function () {
      // On macOS it's common to re-create a window in the app when the
      // dock icon is clicked and there are no other windows open.
      if (BrowserWindow.getAllWindows().length === 0) createWindow(railsApp)
    })
  }*/

 /* setTimeout(() => start(), 6000) */
})




// Quit when all windows are closed, except on macOS. There, it's common
// for applications and their menu bar to stay active until the user quits
// explicitly with Cmd + Q.
app.on('window-all-closed', function () {
  if (process.platform !== 'darwin') app.quit()
})



// Handle window controls via IPC
ipcMain.on('shell:open', () => {   

      const { exec } = require("child_process");

    exec("xdotool move_test", (error, stdout, stderr) => {
      if (error) {
          console.log(`error: ${error.message}`);
          return;
      }
      if (stderr) {
          console.log(`stderr: ${stderr}`);
          return;
      }
      console.log(`stdout: ${stdout}`);
    })
})

ipcMain.on('shell:open_vss', () => {   

  const { exec } = require("child_process");

  exec("( speaker-test -t sine -f 1000 )& pid=$! ; sleep 0.1s ; kill -9 $pid", (error, stdout, stderr) => {
    if (error) {
        console.log(`error: ${error.message}`);
        return;
    }
    if (stderr) {
        console.log(`stderr: ${stderr}`);
        return;
    }
    console.log(`stdout: ${stdout}`);
  })
  exec("node open_vss.js", (error, stdout, stderr) => {
    if (error) {
        console.log(`error: ${error.message}`);
        return;
    }
    if (stderr) {
        console.log(`stderr: ${stderr}`);
        return;
    }
    console.log(`stdout: ${stdout}`);
  })
})


ipcMain.on('shell:choose_file', () => {   

  const { screen } = require('electron')

  const primaryDisplay = screen.getPrimaryDisplay()
  const { width, height } = primaryDisplay.workAreaSize
  

  overlay = new BrowserWindow({ x:360,y:30,width: width-300,  height: height-30,  
    autoHideMenuBar:true , alwaysOnTop:true, frame: false, transparent:true,
    webPreferences: {
      nodeIntegration: true,
      preload: path.join(__dirname, "preload.js")
    }
  })

  overlay.loadURL('file://' + __dirname + '/overlay.html')
  const { exec } = require("child_process");  

   exec("xdotool resize_controller", (error, stdout, stderr) => {
    if (error) {
        console.log(`error: ${error.message}`);
        return;
    }
    if (stderr) {
        console.log(`stderr: ${stderr}`);
        return;
    }
    console.log(`stdout: ${stdout}`);
})
  
  exec("xdotool move_1", (error, stdout, stderr) => {
    if (error) {
        console.log(`error: ${error.message}`);
        return;
    }
    if (stderr) {
        console.log(`stderr: ${stderr}`);
        return;
    }
    console.log(`stdout: ${stdout}`);
    
  }) 

  exec("code test.md", (error, stdout, stderr) => {
    if (error) {
        console.log(`error: ${error.message}`);
        return;
    }
    if (stderr) {
        console.log(`stderr: ${stderr}`);
        return;
    }
    console.log(`stdout: ${stdout}`);
    
  })


 
})

function move_2(){

  const { exec } = require("child_process");
  exec("xdotool move_2", (error, stdout, stderr) => {
    if (error) {
        console.log(`error: ${error.message}`);
        return;
    }
    if (stderr) {
        console.log(`stderr: ${stderr}`);
        return;
    }
    console.log(`stdout: ${stdout}`);
  })

}

ipcMain.on('shell:write_code', () => {   
  overlay.close();

  setTimeout(function(){ move_2(); }, 1000);
  
  const { screen } = require('electron')

  const primaryDisplay = screen.getPrimaryDisplay()
  const { width, height } = primaryDisplay.workAreaSize

  overlay = new BrowserWindow({ x:0,y:30,width: 300,  height: height-30,  
    autoHideMenuBar:true , alwaysOnTop:true, frame: false, transparent:true,
    webPreferences: {
      nodeIntegration: true,
      preload: path.join(__dirname, "preload.js")
    }
  })

  overlay.loadURL('file://' + __dirname + '/overlay.html')
})

function move_3(){

  const { exec } = require("child_process");
  exec("xdotool move_3", (error, stdout, stderr) => {
    if (error) {
        console.log(`error: ${error.message}`);
        return;
    }
    if (stderr) {
        console.log(`stderr: ${stderr}`);
        return;
    }
    console.log(`stdout: ${stdout}`);
})
}

ipcMain.on('shell:run_code', () => {   

  overlay.close();

  setTimeout(function(){ move_3(); }, 1000);
 


  const { screen } = require('electron')

  const primaryDisplay = screen.getPrimaryDisplay()
  const { width, height } = primaryDisplay.workAreaSize

  overlay = new BrowserWindow({ x:0,y:0,width: width,  height: height-180,  
    autoHideMenuBar:true , alwaysOnTop:true, frame: false, transparent:true,
    webPreferences: {
      nodeIntegration: true,
      preload: path.join(__dirname, "preload.js")
    }
  })

  overlay.loadURL('file://' + __dirname + '/overlay.html')
  
})

ipcMain.on('shell:quit', () => {   
  app.quit();
})  