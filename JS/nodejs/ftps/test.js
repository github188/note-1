const { spawn } = require('child_process');
const ls = spawn('dir', { 
    // cwd: `F:/zhangwj999/note/JS/nodejs/ftps/`,
    stdio: 'inherit',
    shell: true
});

console.log( ls )

ls.on('data', (data) => {
  console.log(`stdout: ${data}`);
});

// ls.stderr.on('data', (data) => {
//   console.log(`stderr: ${data}`);
// });

ls.on('close', (code) => {
  console.log(`子进程退出码：${code}`);
});

const { exec } = require('child_process');
exec('dir', (error, stdout, stderr) => {
  if (error) {
    console.error(`exec error: ${error}`);
    return;
  }
  console.log(`stdout: ${stdout}`);
  console.log(`stderr: ${stderr}`);
});