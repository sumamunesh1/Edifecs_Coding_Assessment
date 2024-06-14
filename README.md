# Edifecs_Coding_Assessment

Defining the terraform code to create infrastructure in AWS cloud platform

Step1: created provider terraform file (provider.tf) to define the provider information.

Step2: created variable terraform file (variables.tf) to define the variables.

Step3: created a main terraform file (main.tf) defining ec2 instance, application load balancer to listen on port 80 and forward traffic to the EC2 instance, security group that allows incoming SSH traffic on port 22 and incoming HTTP traffic on port 80, listener blocks.
Step4: created a module so that code can be reusable.
Step5: created a main terraform file by defining module and tfvars file to pass the values during terraform plan/ apply.

Setup the Jenkins pipeline job
Step1: Install the Terraform plugins on Jenkins.
Step2: Install the terraform binaries
Step3: create a new Jenkins pipeline. Select pipeline job.
Step4: configure the git source code settings
Step5: write the pipeline script ‘Jenkinsfile’
Step6: configure with access key and secret key to access the aws environment.
