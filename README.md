# DevOps Infrastructure Platform

## Overview

This project demonstrates basic DevOps infrastructure practices using Docker, Terraform, Ansible, Kubernetes, Prometheus, and GitHub Actions.

The goal is to create a maintainable infrastructure project with version control, automated validation, and deployment documentation.

## Project Structure

```text
infrastructure/
├── terraform/
│   ├── main.tf
│   └── variables.tf
├── ansible/
│   └── playbook.yml
├── kubernetes/
│   ├── deployment.yaml
│   └── service.yaml
├── docker/
│   └── Dockerfile
├── monitoring/
│   └── prometheus.yml
├── .github/
│   └── workflows/
│       └── ci.yml
├── .gitignore
└── README.md
```

## Technologies

- Docker: container image creation.
- Terraform: infrastructure as code.
- Ansible: server configuration automation.
- Kubernetes: application deployment and service discovery.
- Prometheus: metrics collection.
- GitHub Actions: automated validation and CI.
- Git: version control and collaborative workflows.

## Prerequisites

Install the tools required for the components you want to run:

- Git
- Docker Desktop
- Terraform
- Ansible (typically on Linux or WSL)
- kubectl and a Kubernetes environment
- Prometheus, if running monitoring locally

## Getting Started

Clone the repository:

```bash
git clone <YOUR_GITHUB_REPOSITORY_URL>
cd infrastructure
```

Build the Docker image after the Dockerfile is implemented:

```bash
docker build -t infrastructure-app -f docker/Dockerfile .
```

Validate Terraform configuration:

```bash
cd terraform
terraform init -backend=false
terraform fmt -check
terraform validate
```

Kubernetes manifests can be applied to a configured cluster using:

```bash
kubectl apply -f kubernetes/
```

Review the configuration before applying it to any real environment.

## CI

GitHub Actions will run automated checks on pushes and pull requests. The workflow will be defined in `.github/workflows/ci.yml`.

## Deployment

Deployment instructions and environment-specific configuration will be documented as the project develops. Do not commit credentials, private keys, Terraform state, or other secrets.

## Git Workflow

Development uses descriptive feature branches, meaningful commit messages, and pull requests targeting the `main` branch.

## Project Status

This project is under development. Configuration files and validation steps will be added and tested incrementally.

## Deployment Guide

### 1. Build and run with Docker

Run these commands from the repository root:

```bash
docker build -t infrastructure-app -f docker/Dockerfile .
docker run -d --name infrastructure-app -p 8080:80 infrastructure-app
```

Open http://localhost:8080 in a browser.

To stop and remove the container:

```bash
docker rm -f infrastructure-app
```

### 2. Validate Terraform

```bash
cd terraform
terraform fmt -check
terraform init -backend=false
terraform validate
```

This starter configuration demonstrates Terraform variables and outputs. It does not provision cloud resources.

### 3. Validate Kubernetes manifests

With kubectl configured for a Kubernetes cluster:

```bash
kubectl apply --dry-run=client -f kubernetes/
```

To deploy to the selected cluster:

```bash
kubectl apply -f kubernetes/
kubectl get deployments,services
```

### 4. Run the Ansible playbook

On a system with Ansible installed:

```bash
ansible-playbook --syntax-check ansible/playbook.yml
ansible-playbook ansible/playbook.yml
```

### 5. Configure Prometheus

Review `monitoring/prometheus.yml`. Configure Prometheus and the Nginx exporter so the configured service names resolve in their shared network. The exporter must be running for Nginx metrics to be collected.

### 6. Continuous Integration

GitHub Actions runs on pushes to `main` and feature branches, and on pull requests targeting `main`. It validates YAML syntax, checks Terraform formatting and validity, and builds the Docker image.

### Security

Do not commit secrets, access tokens, private keys, credentials, or Terraform state files.