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
                echo 'Docker step'
                bat 'docker build -t api_image -f Dockerfile .'
                bat 'docker run -p 6069:55031 api_image'
                
            }
        }
    }

 

}