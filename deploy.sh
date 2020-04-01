#!/bin/bash

set -xe

# Set Env vars
TF_IN_AUTOMATION="true"

# Run compliant_check
terraform init

terraform plan -var="github_token=$1" -var="organization_name=$2"

terraform refresh -var="github_token=$1" -var="organization_name=$2"

