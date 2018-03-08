// Carga del módulo de http.
let http = require('http');

// Declaración de constantes.
const ENV_PORT = 8000;

// Configuración del servidor HTTP.
let servidor = http.createServer((request,response) => {
  response.writeHead(200, {"Content-Type": "text/plain"});
  response.end("Hola, desde NodeJS.")
})

servidor.listen(ENV_PORT);
console.log("Servidor arrancado y disponible en la siguiente dirección. http://127.0.0.1:"+ENV_PORT)