// create bash process -> open stream *
var terminal = require('child_process').spawn('bash');

// mount webdav *
setTimeout(function() {  

  // dynamic path support *
  require('fs').writeFileSync(__dirname+'/mount.sh', '#!/bin/bash\n echo "Mounting WebDav..."; \n mount_webdav -i http://localhost:8080/ "'+__dirname+'/../workspace/content"'); 
  terminal.stdin.write('echo `chmod a+x '+__dirname+'/mount.sh`');  
  
  // mount webdav
  terminal.stdin.write('echo `open '+__dirname+'/mount.sh`');

  // cleanup
  terminal.stdin.write('echo `sleep 10  && rm '+__dirname+'/mount.sh`');  
  terminal.stdin.end();
}, 1);