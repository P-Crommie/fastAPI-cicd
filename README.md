# FastAPI CI/CD Project

This repository contains the source code and deployment pipeline for a FastAPI project. FastAPI is a modern, fast, and highly performant web framework for building APIs with Python. This README provides an overview of the CI/CD pipeline setup using GitHub Actions.

## Project Directory Structure

The repository is organized into the following directory structure:

```bash
.
├── app
│   ├── api
│   │   ├── __init__.py
│   │   └── v1
│   │       ├── api.py
│   │       ├── endpoints
│   │       │   ├── __init__.py
│   │       │   └── services.py
│   │       └── __init__.py
│   ├── main.py
│   └── tests
│       ├── __init__.py
│       └── test_main.py
├── terraform
│   ├── lambda
│   │   ├── data.tf
│   │   ├── main.tf
│   │   ├── provider.tf
│   │   ├── role.tf
│   │   └── variables.tf
│   └── s3
│       ├── kmskey.tf
│       ├── lifecycle.tf
│       ├── main.tf
│       ├── provider.tf
│       └── variables.tf
├── .github
│   └── scripts
│       └── getTags.sh
├── README.md
└── requirements.txt
```

## Components

### app Directory

The `app` directory serves as the core of the application, encompassing both the main code and testing components.

### terraform Directory

The terraform directory contains Terraform configurations for managing AWS resources.

`lambda`: Terraform configurations for AWS Lambda function deployment.

* `data.tf`: Data sources used in the configuration.
* `main.tf`: Main Lambda function deployment configuration.
* `provider.tf`: Provider configuration.
* `role.tf`: IAM role configuration for Lambda function.
* `variables.tf`: Variable definitions.

`s3`: Terraform configurations for AWS S3 bucket management.

* `kmskey.tf`: KMS key configuration.
* `lifecycle.tf`: Lifecycle policy for S3 bucket.
* `main.tf`: Main S3 bucket configuration.
* `provider.tf`: Provider configuration.
* `variables.tf`: Variable definitions.

### `.github` Directory

The `.github` directory contains GitHub Actions related files.

* `scripts`: Custom scripts used in the GitHub Actions workflow.
  * `getTags.sh`: Script to retrieve version tags.

# Continuous Integration and Continuous Deployment

The CI/CD pipeline is triggered on every push to the `main` branch and on pull requests targeting the `main` branch. It consists of two main jobs: `continuous-integration` and `continuous-deployment`.

* **Continuous Integration (continuous-integration):** This job builds, tests, and packages the FastAPI application. It creates a compressed zip archive (`api.zip`) of the application and its dependencies.
* **Continuous Deployment (continuous-deployment):** This job handles the deployment of the FastAPI application to an AWS Lambda function and an S3 bucket. The deployment is triggered after the successful completion of the continuous-integration job.

For detailed information about each step and its purpose, refer to the comments within the GitHub Actions workflow file (`.github/workflows/main.yml`) provided in this repository.

## Secrets and Variables

The pipeline requires certain secrets and variables to function properly. Make sure to set them up in your GitHub repository:

**secrets**

* `AWS_ACCESS_KEY_ID`: AWS access key for deploying to AWS services.
* `AWS_SECRET_ACCESS_KEY`: AWS secret access key for deploying to AWS services.
* `AWS_DEFAULT_REGION`: Default AWS region for deployment.

**variables**

* `S3_BUCKET`: AWS S3 bucket name for deployment.
* `LAMBDA_NAME`: AWS Lambda function name for deployment.
