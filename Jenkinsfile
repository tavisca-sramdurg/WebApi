pipeline {
    agent any

    environment {
    registry = "sramdurg/repo456"
    registryCredential = 'dockerhub'
  }
    
    parameters {
        string(defaultValue: "BasicApi.sln", description: 'Solution file name', name: 'solutionName')
        string(defaultValue: "TestWebApi/TestWebApi.csproj", description: 'Test file name', name: 'testName')
        string(name: 'USERNAME', defaultValue: 'sramdurg')
        string(name: 'PASSWORD', defaultValue: 'charpach45')
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
                bat 'docker build -t api_image -f Dockerfile .'
             }
        }

        stage('Login'){
            steps{
                echo 'Login into docker'
                bat 'docker login -u sramdurg -p charpach45'
                
            }
        }
        stage('Tag docker image'){
            steps {
                echo 'tag docker'
                bat 'docker tag api_image:latest sramdurg/repo456:latest'
            }
        }
        stage('Push the image'){
            steps{
                echo 'push the image'
                bat 'docker push sramdurg/repo456:latest'
            }
        }
        stage('Remove image'){
            steps{
                echo 'untag the image'
                bat 'docker rmi api_image'
            }
        }

        stage('pull docker image'){
            steps
            {
                echo 'pull the image'
                bat 'docker pull sramdurg/repo456:latest'
            }
        }
        stage('run docker image'){
            steps{
                echo 'run the image'
                bat 'docker run -p 6960:55031 latest'
            }
        }
    }
}