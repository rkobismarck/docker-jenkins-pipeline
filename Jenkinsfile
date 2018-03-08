node {
    def app

    stage('Clonar repositorio.') {
        /* Clonaremos el repositorio en nuestro espacio de trabajo. */
        checkout scm
    }

    stage('Construir imagen.') {
        /* Construcción de la imagen actual, es análogo a la 
        instrucción build de la línea de comandos de Docker*/
        app = docker.build("rokokito/nodehola")
    }

    stage('Ejecución de pruebas.') {
      /* Ejecutaremos el framework de testing para nuestra imagen. */
        app.inside {
            sh 'echo "Tests passed"'
        }
    }

    stage('Push de imagen al registro de Docker.') {
      /* Haremos el push de la imagen con dos tags:
      *  primero, incrementamos el numero de build en jenkins
      *  segundo asignaremos el tag de "latest"
      */
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
}
