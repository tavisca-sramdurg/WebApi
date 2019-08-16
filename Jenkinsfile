pipeline {
    agent any

    environment {
    registry = "sramdurg/repo45"
    registryCredential = 'dockerhub'
  }
    
    parameters {
        string(defaultValue: "BasicApi.sln", description: 'Solution file name', name: 'solutionName')
        string(defaultValue: "TestWebApi/TestWebApi.csproj", description: 'Test file name', name: 'testName')
        string( name: 'GIT_SSH_PATH', defaultValue: "https://github.com/tavisca-sramdurg/WebApi",description: '')
        string(name: 'DOCKER_FILE', defaultValue: 'apiImage')
        string(name: 'DOCKER_CONTAINER_NAME', defaultValue: 'api-container')
        string(name: 'USERNAME', defaultValue: 'sramdurg')
        string(name: 'PASSWORD', defaultValue: 'charpach45$%')
    }
    
    stages { 
        stage('Build') {
            
            steps{
                echo 'Build step'
                bat 'dotnet build %solutionName% -p:Configuration=release -v:q'
            }
        }
        stage('Test') {
            
            steps{
                echo 'Test step'
                bat 'dotnet test %testName%'
            }
        }
        stage('Publish') {
            
            steps{
                echo 'Publish step'
                bat 'dotnet publish %solutionName% -c RELEASE -o Publish'
            }
        }
        
        stage('Docker build and run') {
            
             steps{
                bat 'docker build -t ${DOCKER_FILE} -f Dockerfile .'
             }
        }

        stage('Upload'){
            steps{
                echo 'Login into docker'
                bat 'docker login -u ${USERNAME} -p ${PASSWORD}'
                
            }
            steps {
                echo 'tag docker'
                bat 'docker tag ${DOCKER_FILE}:latest sramdurg/repo45:latest'
            }
            steps{
                echo 'push the image'
                bat 'docker push sramdurg/repo45:latest'
            }
            steps{
                echo 'untag the image'
                bat 'docker rmi ${DOCKER_FILE}'
            }
        }

        stage('pull docker image'){
            steps
            {
                echo 'pull the image'
                bat 'docker pull sramdurg/repo45:${DOCKER_FILE}'
            }
        }
        stage('run docker image'){
            steps{
                echo 'run the image'
                bat 'docker run -p 6960:55031 ${DOCKER_FILE}'
            }
        }
    }
}