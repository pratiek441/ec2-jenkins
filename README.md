# Jenkins Installation and Integration with Docker & Git on AWS EC2

## Project Overview

This project demonstrates how to install and configure Jenkins on an AWS EC2 instance (Amazon Linux), along with Git, Docker, Java, and Maven.

The objective is to prepare a Jenkins environment that can be used for CI/CD pipeline automation and application deployment.

## 1. Launch AWS EC2 Instance

Launch an EC2 instance with the following configuration:

| Configuration | Details |
|---|---|
| AMI | Amazon Linux |
| Instance Type | t3.large |
| Key Pair | jenkins.pem |
| Security Group | Jenkins-SG |

### Security Group Inbound Rules

| Type | Port | Purpose |
|---|---:|---|
| SSH | 22 | Connect to EC2 |
| HTTP | 80 | Web traffic |
| HTTPS | 443 | Secure web traffic |
| Custom TCP | 8080 | Jenkins Dashboard |

**Connect to EC2 instance** using the downloaded `jenkins.pem` key pair.

## 2. Update System Packages

Update the Amazon Linux operating system.

```bash
sudo yum update -y
```

## 3. Install and Configure Git

Install Git:

```bash
sudo yum install git -y
```

Verify Git installation:

```bash
git --version
```

Configure Git username and email:

```bash
sudo git config --global user.name "pratiek441"
sudo git config --global user.email "pratikpande998@gmail.com"
```

Verify Git configuration:

```bash
sudo git config --list
```

## 4. Install and Configure Docker

Install Docker:

```bash
sudo yum install docker -y
```

Start Docker service:

```bash
sudo systemctl start docker
```

Enable Docker to start automatically after system reboot:

```bash
sudo systemctl enable docker
```

Check Docker service status:

```bash
sudo systemctl status docker
```

Verify Docker:

```bash
docker --version
docker ps
```

## 5. Install Java 21 (Amazon Corretto)

Search for Java 21 packages:

```bash
sudo yum search java-21
```

Install Java 21:

```bash
sudo dnf install java-21-amazon-corretto -y
```

Verify Java installation:

```bash
java --version
```

**Why Java?**

Jenkins requires Java to run. Java 21 is used as the runtime environment for Jenkins.

## 6. Install Maven

Install Maven:

```bash
sudo yum install maven -y
```

Verify Maven installation:

```bash
mvn --version
```

**Why Maven?**

Maven is a build automation tool used to compile, test, and package Java applications.

## 7. Install Jenkins

// copy script from https://www.jenkins.io/doc/book/installing/linux/#red-hat-centos

Add the Jenkins repository:

```bash
sudo wget -O /etc/yum.repos.d/jenkins.repo \
https://pkg.jenkins.io/rpm/jenkins.repo
```

Update repository packages:

```bash
sudo yum upgrade -y
```

Install Jenkins:

```bash
sudo yum install jenkins -y
```

Verify Jenkins installation:

```bash
jenkins --version
```

## 8. Start and Enable Jenkins

Start Jenkins:

```bash
sudo systemctl start jenkins
```

Enable Jenkins to start automatically after reboot:

```bash
sudo systemctl enable jenkins
```

Check Jenkins service status:

```bash
sudo systemctl status jenkins
```

## 9. Configure Jenkins with Docker

To allow Jenkins to execute Docker commands, add the Jenkins user to the Docker group.

```bash
sudo usermod -aG docker jenkins
```

Restart Jenkins to apply the changes:

```bash
sudo systemctl restart jenkins
```

Verify Docker service:

```bash
docker ps
```

**Important:** Group membership changes apply to new sessions. Restarting Jenkins allows its service to pick up the updated group membership.

## 10. Access Jenkins Dashboard

Open your browser and enter:

```text
http://<EC2-PUBLIC-IP>:8080
```

### Retrieve Initial Administrator Password

Execute the following command on your EC2 instance:

```bash
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

Copy the generated password and paste it into the Jenkins initial setup screen.

### Jenkins Initial Setup

1. Open Jenkins using the EC2 public IP and port 8080.
2. Enter the initial administrator password.
3. Select **Install suggested plugins**.
4. Create your administrator user.
5. Configure the Jenkins URL.
6. Complete the setup.
7. Access the Jenkins Dashboard.

## 11. Verify Installation

Run the following commands to verify the installed tools:

```bash
git --version
docker --version
java --version
mvn --version
jenkins --version
```

Check running services:

```bash
sudo systemctl status docker
sudo systemctl status jenkins
```

## Project Architecture

```text
          AWS EC2 Instance
          (Amazon Linux)
                 |
       ---------------------
       |         |         |
      Git      Docker    Jenkins
                           |
                    Java 21 + Maven
                           |
                    Jenkins Dashboard
                       Port 8080
```

## Technologies Used

- **Cloud Platform:** AWS
- **Operating System:** Amazon Linux
- **CI/CD Tool:** Jenkins
- **Version Control:** Git
- **Containerization:** Docker
- **Programming Runtime:** Java 21 (Amazon Corretto)
- **Build Tool:** Maven

## Learning Outcomes

- Launched and configured an AWS EC2 instance.
- Installed and configured Git.
- Installed and managed Docker services.
- Installed Java 21 and Maven.
- Installed and configured Jenkins.
- Configured Jenkins to access Docker.
- Accessed the Jenkins dashboard through the EC2 public IP.
- Prepared the environment for CI/CD pipeline implementation.

## Future Enhancements

- Integrate Jenkins with GitHub.
- Create a Jenkins Freestyle project.
- Build a Jenkins Pipeline using a Jenkinsfile.
- Automate Maven build and testing.
- Build Docker images through Jenkins.
- Push Docker images to Docker Hub.
- Automate application deployment on EC2.

---

**Project:** Jenkins Installation and Integration with Docker & Git  
**Cloud:** AWS EC2  
**CI/CD:** Jenkins
