# Go App with AKS Auto-Deployment using ArgoCD

This project demonstrates how to automatically deploy a simple Go application to Azure Kubernetes Service (AKS) using ArgoCD for continuous deployment.

## Overview

The project includes:

- A basic "Hello, World!" Go application (`main.go`).
- A Dockerfile to containerize the application.
- Kubernetes manifests (`deployment.yaml`, `service.yaml`, `gateway.yaml`, `virtualservice.yaml`) for deploying the application with Istio ingress.
- An ArgoCD `Application` definition (`application.yaml`) to manage the deployment.
- A GitHub Actions workflow (`main.yaml`) to build and push the Docker image to Azure Container Registry (ACR).

## Architecture

The CI/CD workflow follows these steps:

1. **Code Changes:** When code is pushed to the `main` branch, the GitHub Actions workflow is triggered.
2. **Build and Push:** The workflow builds a Docker image of the application and pushes it to ACR.
3. **ArgoCD Deployment:** ArgoCD monitors the Git repository for changes. When a new image is pushed, ArgoCD automatically deploys the updated application to the AKS cluster.
4. **Istio Ingress:** Istio Gateway and VirtualService route external traffic to the application.

## Prerequisites

- **Azure Account:** An active Azure subscription with an AKS cluster and an Azure Container Registry (ACR).
- **GitHub Account:** A GitHub repository containing this project's code.
- **ArgoCD:** Installed and configured in your AKS cluster.
- **Istio:** Installed in your AKS cluster.
- **GitHub Secrets:** Configure the following secrets in your GitHub repository:
    - `ACR_LOGIN_SERVER`: The login server for your ACR.
    - `ACR_CLIENT_ID`: The client ID for your ACR.
    - `ACR_CLIENT_SECRET`: The client secret for your ACR.
    - `ACR_REPOSITORY`: The name of your ACR repository.
    - `ACR_IMAGE_TAG`: The tag for your Docker image.
    - `AKS_RESOURCE_GROUP`: The resource group of your AKS cluster.
    - `AKS_CLUSTER_NAME`: The name of your AKS cluster.
    - `KUBECONFIG`: The kubeconfig for your AKS cluster.

## Deployment

1. **Fork this repository:** `git clone git@github.com:Neetparty/Hello-World-Go-App.git`
2. **Update Image:** Replace `your-registry/hello-go-app` in `deployment.yaml` with your ACR image path.
3. **Configure Secrets:** Set the required GitHub secrets in your repository settings.
4. **Deploy ArgoCD Application:** Apply the `application.yaml` file to your cluster to create the ArgoCD `Application`.

## Usage

Once the application is deployed, you can access it through the Istio Ingress Gateway.

## Notes

- This project provides a basic example of auto-deployment with ArgoCD. You can customize the manifests and workflow to fit your specific needs.
- Make sure the Istio Ingress Gateway is properly configured to route traffic to your application.
- The provided GitHub Actions workflow assumes you are using Azure CLI to authenticate to your AKS cluster.

## Disclaimer

* This project is under development and subject to change.
* You should customize the CI/CD pipeline to fit your specific needs.

## Contributors

* [Neetparty](https://github.com/Neetparty)

## License

[MIT](./LICENSE)
