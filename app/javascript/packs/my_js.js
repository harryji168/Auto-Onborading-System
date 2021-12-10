 
$( document ).ready(function() {
   
 
      window.open('http://localhost:16888/navigate', '_blank', 'title="nav", nodeIntegration=yes,  alwaysOnTop=true, autoHideMenuBar=true, top=1021,left=0,width=1882,height=60,frame=true, transparent=true');
 
const button = document.getElementById('choose_file');
button.addEventListener('click', () => {  
  alert("try");
  const { exec } = require("child_process"); 
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
})
 });