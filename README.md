# Terraform Github Compliance Validator

## Description
This project intends can help you to ensure that projects into your organization be following a defined compliance policy.

You can:
- Check repositories publicly exposed
- Check repositories that doesn't follow the defined policy

## Usage
- Build the docker image
`$ docker build -t terraform-github-compliance-validator:latest .`
- Run the docker image passing a github token valid into desired org and organization name
`docker run -it terraform-github-compliance-validator:latest <github token> <organization name>
`