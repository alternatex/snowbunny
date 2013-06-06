// create bash process -> open stream *
var terminal = require('child_process').spawn('bash');

// start Sling *
setTimeout(function() {  

  // delegate to shutdown bash script *
  terminal.stdin.write('echo `umount -h http://localhost:8080/; cd '+__dirname+'/../workspace/system && ./finit`');
  terminal.stdin.end();
}, 1);