var FTPS = require('ftps');

var ftps = new FTPS({
  host: '10.110.1.208',//'10.165.1.171', // required 
  username: 'root', // Optional. Use empty username for anonymous access. 
  password: 'inspur',//'jzyx@was2', // Required if username is not empty, except when requiresPassword: false 
  protocol: 'sftp', // Optional, values : 'ftp', 'sftp', 'ftps', ... default: 'ftp' 
  // protocol is added on beginning of host, ex : sftp://domain.com in this case 
  port: 22, // Optional
  // port is added to the end of the host, ex: sftp://domain.com:22 in this case 
  escape: true, // optional, used for escaping shell characters (space, $, etc.), default: true 
  retries: 2, // Optional, defaults to 1 (1 = no retries, 0 = unlimited retries) 
  timeout: 10, // Optional, Time before failing a connection attempt. Defaults to 10 
  retryInterval: 5, // Optional, Time in seconds between attempts. Defaults to 5 
  retryMultiplier: 1, // Optional, Multiplier by which retryInterval is multiplied each time new attempt fails. Defaults to 1 
  requiresPassword: true, // Optional, defaults to true 
  autoConfirm: true, // Optional, is used to auto confirm ssl questions on sftp or fish protocols, defaults to false 
  cwd: '/',//'/opt', // Optional, defaults to the directory from where the script is executed 
  additionalLftpCommands: '', // Additional commands to pass to lftp, splitted by ';' 
  requireSSHKey:  false, //  Optional, defaults to false, This option for SFTP Protocol with ssh key authentication 
//   sshKeyPath: '/home1/phrasee/id_dsa' // Required if requireSSHKey: true , defaults to empty string, This option for SFTP Protocol with ssh key authentication 
});
// console.log( ftps )
// Do some amazing things
// ftps.ls().exec( console.log );
ftps.pwd().exec( console.log );
// console.log( __dirname )
// ftps.cd('/opt').addFile(__dirname + '/test.txt').exec(console.log);
// ftps.get( '/root/restart', [ __dirname + 'restart' ] ).exec(console.log);