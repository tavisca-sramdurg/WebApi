pipeline {
    agent any

    environment {
    registry = "sramdurg/repo456"
    registryCredential = 'dockerhub'
  }
    
    parameters {
        string(defaultValue: "BasicApi.sln", description: 'Solution file name', name: 'solutionName')
        string(defaultValue: "TestWebApi/TestWebApi.csproj", description: 'Test file name', name: 'testName')
        string(name: 'username', defaultValue: 'sramdurg')
        string(name: 'password', defaultValue: 'charpach45')
        string(defaultValue: 'api_image', description: 'Name of the image on your local machine', name: 'localImageName')
        string(defaultValue: 'repo456', description: 'Name of the repo on dockerhub', name: 'remoteImageName')
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
                bat 'docker build -t %localImageName% -f Dockerfile .'
             }
        }

        stage('Login'){
            steps{
                echo 'Login into docker'
                bat 'docker login -u %username% -p %password%'
                
            }
        }
        stage('Tag docker image'){
            steps {
                echo 'tag docker'
                bat 'docker tag %localImageName%:latest %username%/%remoteImageName%:latest'
            }
        }
        stage('Push the image'){
            steps{
                echo 'push the image'
                bat 'docker push %username%/%remoteImageName%:latest'
            }
        }
        stage('Remove image'){
            steps{
                echo 'Remove the local image'
                bat 'docker rmi %localImageName%'
            }
        }

        stage('pull docker image'){
            steps
            {
                echo 'pull the image'
                bat 'docker pull %username%/%remoteImageName%:latest'
            }
        }
        stage('run docker image'){
            steps{
                echo 'run the image'
                bat 'docker run -p 6960:55031 %username%/%remoteImageName%'
            }
        }
    }
}