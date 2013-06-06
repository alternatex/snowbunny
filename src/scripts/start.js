// create bash process -> open stream *
var terminal = require('child_process').spawn('bash');

// start Sling *
setTimeout(function() {  

  // delegate to startup bash script *
  terminal.stdin.write('echo `cd '+__dirname+'/../workspace/system && ./init`');
  terminal.stdin.end();
}, 1);