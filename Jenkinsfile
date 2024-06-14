pipeline{
    agent any
    stages {
        stage(Checkout){
            steps{
                git branch:'master' url:'https://github.com/sumamunesh1/Edifecs_Coding_Assessment'
            }
        }
        stage(Terraform Init) {
            steps{
                scripts{
                    echo "Initializing the working directory..."
                    sh 'terraform init'
                }

            }
        }
        stage(Terraform Validate) {
            steps{
                scripts{
                    echo "Validating the terraform code..."
                    sh 'terraform validate'
                }
            }
        }
        stage(Terraform Plan) {
            steps{
                scripts{
                    echo "Executing the terraform plan"
                    sh 'terraform plan -var-file=input_values.tfvars'
                }
            }

        }
        stage(Get Approval) {
            steps{
                //create approval button with timeout of 10minutes
                timeout(time:10, unit:"MINUTES"){
                    input message: 'Do you want to proceed and apply the changes?',ok: 'Yes'
                }
            }
        }
        stage(Terraform apply) {
            steps{
                scripts{
                    echo "Thanks for the approval..."
                    echo "Applying the changes"
                    sh 'terraform apply'
                }
            }
        }
    }
}