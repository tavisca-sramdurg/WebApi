pipeline {
    agent any
    
    parameters {
        string(defaultValue: "BasicApi.sln", description: 'Solution file name', name: 'solutionName')
        string(defaultValue: "TestWebApi/TestWebApi.csproj", description: 'Test file name', name: 'testName')
    }
    
    stages { 
        stage('Build') {
            
            steps{
                echo 'Build step'
                sh 'dotnet build %solutionName% -p:Configuration=release -v:q'
            }
        }
        stage('Test') {
            
            steps{
                echo 'Test step'
                sh 'dotnet test %testName%'
            }
        }
        stage('Publish') {
            
            steps{
                echo 'Publish step'
                sh 'dotnet publish %solutionName% -c RELEASE -o Publish'
            }
        }
        
        stage('Docker build and run') {
            
            steps{
                echo 'Docker step'
                sh 'docker build -t api_image -f Dockerfile .'
                sh 'docker run api_image -p 8087:55031'
                
            }
        }
    }

 

}