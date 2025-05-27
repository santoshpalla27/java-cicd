# Java CI/CD Pipeline with Jenkins, Docker & Kubernetes

A comprehensive DevOps pipeline that automates the entire software development lifecycle from code commit to production deployment, incorporating security scanning, quality gates, and container orchestration.

## 🏗️ Architecture Overview

This project implements a complete CI/CD pipeline for a Java application using modern DevOps practices and tools:

- **Source Code Management**: Git with automated polling
- **Build Automation**: Maven for dependency management and compilation
- **Code Quality**: SonarQube analysis with quality gates
- **Security Scanning**: Trivy for filesystem and container image vulnerabilities
- **Dependency Security**: OWASP Dependency Check with NVD integration
- **Containerization**: Docker for application packaging
- **Container Registry**: Docker Hub for image storage
- **Orchestration**: Kubernetes (AWS EKS) for container deployment
- **Artifact Management**: Nexus Repository for artifact storage
- **Notification**: Email notifications for pipeline status

## 🛠️ Technologies Stack

### Core Technologies
- **Java** - Application runtime
- **Maven** - Build automation and dependency management
- **Docker** - Containerization platform
- **Kubernetes** - Container orchestration (AWS EKS)

### DevOps Tools
- **Jenkins** - CI/CD orchestration platform
- **SonarQube** - Code quality and security analysis
- **Trivy** - Vulnerability scanner for filesystems and containers
- **OWASP Dependency Check** - Security vulnerability detection in dependencies
- **Nexus Repository** - Artifact repository management

### Cloud & Infrastructure
- **AWS EKS** - Managed Kubernetes service
- **Docker Hub** - Container image registry

## 🚀 Pipeline Stages

### 1. **Workspace Preparation**
- Clean workspace to ensure fresh build environment

### 2. **Source Code Management**
- Clone latest code from GitHub main branch
- Automated polling for code changes

### 3. **Testing Phase**
- Execute unit tests using Maven
- Validate code functionality before proceeding

### 4. **Security Scanning - Filesystem**
- Trivy filesystem scan for vulnerabilities
- Generate HTML report for security assessment

### 5. **Code Quality Analysis**
- SonarQube static code analysis
- Quality metrics evaluation (bugs, vulnerabilities, code smells)

### 6. **Quality Gate Validation**
- Automated quality gate enforcement
- Pipeline fails if quality standards not met

### 7. **Build & Package**
- Maven clean install
- Generate deployable artifacts

### 8. **Artifact Management**
- Deploy artifacts to Nexus Repository
- Version-controlled artifact storage

### 9. **Dependency Security Check**
- OWASP dependency vulnerability scanning
- NVD API integration for latest vulnerability data

### 10. **Container Operations**
- Remove previous Docker images
- Build new Docker image with build number tagging
- Security scan of container image using Trivy

### 11. **Container Registry**
- Push Docker image to Docker Hub
- Tagged with unique build number

### 12. **GitOps Configuration**
- Update Kubernetes manifests with new image version
- Automated commit and push to repository

### 13. **Kubernetes Deployment**
- Deploy to AWS EKS cluster
- Apply updated manifests to Jenkins namespace

### 14. **Deployment Verification**
- Verify services and pods status
- Ensure successful deployment

### 15. **Notification**
- HTML email notifications with pipeline status
- Color-coded success/failure indicators

## 📋 Prerequisites

### Infrastructure Requirements
- Jenkins server with required plugins
- SonarQube server
- Nexus Repository
- AWS EKS cluster
- Docker Hub account

### Jenkins Plugins
- Maven Integration
- SonarQube Scanner
- Docker Pipeline
- Kubernetes CLI
- OWASP Dependency-Check
- Email Extension

### Required Tools Installation
- Maven
- JDK
- SonarQube Scanner
- Trivy
- Docker
- kubectl

## 🔧 Configuration

### Environment Variables
```bash
SCANNER_HOME=tool 'sonar-scanner'
```

### Required Credentials in Jenkins
- `docker-cred` - Docker Hub credentials
- `github_token` - GitHub personal access token
- `owasp` - NVD API key for OWASP dependency check
- `k8s-token` - Kubernetes cluster access token

### Tool Configurations
- Maven installation: `maven`
- JDK installation: `jdk`
- SonarQube server: `sonar-server`
- Docker installation: `docker`
- OWASP installation: `owasp`

## 🚦 Pipeline Triggers

- **Automatic**: Git polling for changes in main branch
- **Manual**: Triggered through Jenkins UI
- **Webhook**: Can be configured for immediate trigger on git push

## 📊 Monitoring & Reporting

### Generated Reports
- **Trivy Filesystem Scan**: `fs.html`
- **Trivy Image Scan**: `image.html`
- **OWASP Dependency Check**: `dependency-check-report.xml`
- **SonarQube**: Comprehensive code quality dashboard

### Notifications
- HTML email notifications with pipeline status
- Console output links for detailed logs
- Color-coded status indicators

## 🔒 Security Features

### Multi-Layer Security Scanning
1. **Static Code Analysis** - SonarQube vulnerability detection
2. **Filesystem Security** - Trivy scans for malware and secrets
3. **Dependency Vulnerabilities** - OWASP with real-time NVD data
4. **Container Security** - Trivy image scanning for known CVEs

### Quality Gates
- Automated quality gate enforcement
- Pipeline failure on security/quality violations
- Comprehensive vulnerability reporting

## 🎯 Benefits

### For Development Teams
- **Automated Testing** - Immediate feedback on code quality
- **Security Integration** - Built-in vulnerability detection
- **Standardized Deployments** - Consistent environment deployments

### For Operations Teams
- **Infrastructure as Code** - Kubernetes manifests in version control
- **Automated Scaling** - Kubernetes-native scaling capabilities
- **Monitoring Integration** - Ready for observability stack integration

### For Business
- **Faster Time to Market** - Automated deployment pipeline
- **Reduced Security Risk** - Multiple security scanning layers
- **Improved Quality** - Automated quality gates and testing

## 🔄 GitOps Workflow

The pipeline implements GitOps principles:
1. Code changes trigger pipeline
2. New container images are built and scanned
3. Kubernetes manifests are automatically updated
4. Changes are committed back to repository
5. Deployment occurs from updated manifests

## 📈 Scalability Considerations

- **Horizontal Scaling**: Kubernetes enables automatic pod scaling
- **Build Scaling**: Jenkins agents can be scaled based on load
- **Security Scanning**: Parallel execution of different scan types
- **Multi-Environment**: Pipeline can be extended for staging/production

## 🏃‍♂️ Quick Start

1. Fork the repository to your GitHub account
2. Configure Jenkins with required tools and credentials
3. Set up SonarQube server and create project
4. Configure Nexus Repository for artifact storage
5. Set up AWS EKS cluster and obtain access credentials
6. Update pipeline configuration with your specific values
7. Run the pipeline and monitor the execution

## 📞 Support

For issues or questions:
- Check Jenkins console output for detailed error messages
- Review generated security reports for vulnerability details
- Verify Kubernetes cluster status and pod logs
- Contact: santoshpalla27@gmail.com

---

*This pipeline represents a production-ready DevOps implementation suitable for enterprise Java applications.*
