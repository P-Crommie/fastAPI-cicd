# FastAPI CI/CD Project

This repository contains the source code and deployment pipeline for a FastAPI project. FastAPI is a modern, fast, and highly performant web framework for building APIs with Python. This README provides an overview of the CI/CD pipeline setup using GitHub Actions.

## CI and CD Pipeline

The CI/CD pipeline is triggered on every push to the `main` branch and on pull requests targeting the `main` branch. It consists of two main jobs: `continuous-integration` and `continuous-deployment`.

### Continuous Integration (continuous-integration)

The `continuous-integration` job is responsible for building, testing, and packaging the FastAPI application.

1. **Clone Repository:** This step uses the `actions/checkout` action to clone the repository.
2. **Get Tags:** The `getTags.sh` script is executed to retrieve version tags. The obtained tag is stored for later use.
3. **Set up Python Environment:** Python 3.7 is set up using the `actions/setup-python` action. A virtual environment is also created using the installed Python.
4. **Install Python Virtual Environment:** The `virtualenv` package is installed in the Python environment.
5. **Caching Dependencies:** The `actions/cache` action is used to cache the virtual environment based on changes in the `requirements.txt` file.
6. **Activate and Install Dependencies:** If the cache is not hit, the virtual environment is activated, and dependencies are installed using the `requirements.txt` file.
7. **Install App Dependencies:** App-level dependencies are installed using the same `requirements.txt` file.
8. **Build and Run Tests:** The FastAPI app is built, and tests are executed using `pytest`.
9. **Create Zip Archive of Dependencies:** A compressed zip archive (`api.zip`) is created from the installed Python dependencies.
10. **Add App to Zip Archive:** The contents of the `app` directory are added to the `api.zip` archive. The archive is then renamed to include the version tag.
11. **Upload Zip Archive Artifact:** The generated `api.zip` artifact is uploaded to GitHub as an artifact for future use in the deployment job.

### Continuous Deployment (continuous-deployment)

The `continuous-deployment` job handles the deployment of the FastAPI application to an AWS Lambda function and an S3 bucket.

1. **Clone Repository:** The repository is cloned again for the deployment job.
2. **Update Lambda Version:** The version of the Lambda deployment package is updated in the Terraform configuration using the version tag obtained from the `continuous-integration` job.
3. **Install AWS CLI:** The AWS Command Line Interface (CLI) is installed to interact with AWS services.
4. **Download Lambda Deployment Package:** The deployment package generated in the `continuous-integration` job is downloaded from the artifact.
5. **Upload to S3:** The downloaded deployment package is uploaded to an S3 bucket to be used by the Lambda function.
6. **Setup Terraform:** Terraform is set up using the `hashicorp/setup-terraform` action.
7. **Configure AWS Credentials:** AWS credentials are configured for Terraform using the `aws-actions/configure-aws-credentials` action.
8. **Terraform Init:** Terraform is initialized in the `.github/terraform` directory.
9. **Terraform Validate:** Terraform configurations are validated.
10. **Terraform Plan:** A plan is generated to preview the changes that will be applied.
11. **Terraform Apply and Deploy Lambda:** If the branch is `main`, Terraform applies the changes to deploy the Lambda function.
12. **Clean Repository:** Untracked files in the repository are cleaned up using `git clean`.
13. **Create and Push Tag:** A tag is created with the version obtained from the `continuous-integration` job, and it is pushed to the repository.

## Secrets

The pipeline requires certain secrets to function properly. Make sure to set up the following secrets in your GitHub repository:

- `AWS_ACCESS_KEY_ID`: AWS access key for deploying to AWS services.
- `AWS_SECRET_ACCESS_KEY`: AWS secret access key for deploying to AWS services.
- `AWS_DEFAULT_REGION`: Default AWS region for deployment.

For more detailed information about each step and its purpose, refer to the comments within the GitHub Actions workflow file (`/.github/workflows/main.yml`) provided in this repository.
