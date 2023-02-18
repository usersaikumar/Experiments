# Create GCP Instance from Terraform

To create a Google Cloud Platform (GCP) instance from Terraform, you can follow these steps:

1.  First, you need to install the Terraform CLI on your local machine.
    
2.  Set up your GCP credentials so that Terraform can authenticate with GCP. You can do this by creating a service account, downloading the service account key file, and setting the `GOOGLE_APPLICATION_CREDENTIALS` environment variable to point to the key file.
    
3.  Create a new Terraform configuration file (e.g. `main.tf`) and specify the GCP instance you want to create. Here's an example configuration that creates a new `n1-standard-1` instance:
    

### Example

```
provider "google" {
  project = "<your-project-id>"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_compute_instance" "example" {
  name         = "example-instance"
  machine_type = "n1-standard-1"
  zone         = "us-central1-c"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }
}
```

Make sure to replace `<your-project-id>` with your actual GCP project ID.

4.  Initialize your Terraform configuration by running `terraform init` in your terminal.
    
5.  Preview the changes that Terraform will make by running `terraform plan`. This will show you a summary of the resources that will be created, updated, or deleted.
    
6.  If the plan looks good, apply the changes by running `terraform apply`. This will create the GCP instance in your specified zone.
    

That's it! You've now created a GCP instance from Terraform.

# Cloning GitHub Repository to GCP Instance
## Making Connection between GitHub & GCP Instance

1.  Connect to your GCP instance using SSH. You can do this by using the `gcloud` command-line tool or by using the GCP Console. Make sure that you have SSH access to the instance.
    
2.  Install Git on your instance. You can do this by running the following command:
    

```
sudo apt-get update
sudo apt-get install git
```

3.  Clone your GitHub repository by running the following command:



```
git clone https://github.com/<your-username>/<your-repo>.git
```

Replace `<your-username>` with your GitHub username and `<your-repo>` with the name of your repository.

4.  Set up an SSH key on your GCP instance and add it to your GitHub account. This will allow you to push changes to the repository without having to enter your username and password every time.

To do this, run the following commands on your GCP instance:



```
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
```

Then, copy the contents of the `~/.ssh/id_rsa.pub` file and add it to your GitHub account by going to your GitHub account settings and adding a new SSH key.

5.  Configure Git to use your SSH key by running the following commands:



```
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
git config --global core.sshCommand "ssh -i ~/.ssh/id_rsa -F /dev/null"
```

Replace `you@example.com` with your email and `Your Name` with your name.

6.  You can now make changes to the code on your GCP instance and push those changes to your GitHub repository using Git. To push changes to your GitHub repository, run the following commands:



```
cd <your-repo>
git add .
git commit -m "Your commit message"
git push
```

Replace `<your-repo>` with the name of your repository and `Your commit message` with a description of the changes you've made.

That's it! You've now cloned your GitHub repository and set up a connection between your GCP instance and your GitHub account.


# GitHub Actions & WorkFlow using Maven & SonarQube


```
name: Build and Test

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

env:
  MAVEN_CLI_OPTS: "-s ${{github.workspace}}/settings.xml --batch-mode"

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout code
      uses: actions/checkout@v2
      
    - name: Set up JDK 11
      uses: actions/setup-java@v1
      with:
        java-version: 11
        
    - name: Install Maven
      run: sudo apt-get install -y maven
      
    - name: Set up SonarQube
      uses: sonarsource/sonarqube-github-action@master
      with:
        url: ${{ secrets.SONARQUBE_URL }}
        token: ${{ secrets.SONARQUBE_TOKEN }}

    - name: Build with Maven
      run: mvn ${{ env.MAVEN_CLI_OPTS }} clean install
      
    - name: Analyze with SonarQube
      uses: sonarsource/sonar-scanner-cli@master
      with:
        sonar-project-key: "my-project"
        sonar-project-name: "My Project"
        sonar-project-version: "1.0"
        sonar-sources: "src"
```

This workflow does the following:

1.  When a push event occurs on the `main` branch or a pull request is opened against the `main` branch, the workflow is triggered.
    
2.  The code is checked out and JDK 11 is set up.
    
3.  Maven is installed and the SonarQube server is set up with the `sonarsource/sonarqube-github-action` action.
    
4.  The code is built with Maven using the `mvn clean install` command.
    
5.  The code is analyzed with SonarQube using the `sonarsource/sonar-scanner-cli` action.
    

To use this workflow, you'll need to define the `SONARQUBE_URL` and `SONARQUBE_TOKEN` secrets in your repository's settings. Replace the `my-project`, `My Project`, and `1.0` values in the `sonar-project-key`, `sonar-project-name`, and `sonar-project-version` fields with your actual project key, project name, and project version.

This workflow should verify, validate, test, build, and package your code as a jar using Maven and SonarQube. If there are any issues with the code, the SonarQube analysis will provide feedback on how to improve the code quality.

# Creating Docker Image from the Cloned Repository from GitHub in GCP Instance

1.  Install Docker on your GCP instance. You can do this by running the following commands:
    
    
    
    ```
    sudo apt-get update
    sudo apt-get install docker.io
    ```
    
2.  Move into the root directory of your project by running the following command:
    
    
    
    ```
    cd <your-project-root-directory>
    ```
    
    Replace `<your-project-root-directory>` with the path to your project root directory.
    
3.  Create a `Dockerfile` in the root directory of your project by running the following command:
    
    
    
    ```
    touch Dockerfile
    ```
    
4.  Edit the `Dockerfile` by running the following command:
    
    `nano Dockerfile` or `vi DockerFile`
    
    This will open the `Dockerfile` in the Nano text editor or Vim editor.
    
5.  Add the following code to your `Dockerfile`:
    
    
    
    ```
    FROM openjdk:11-jre-slim
    COPY target/<your-jar-file-name>.jar /app.jar
    ENTRYPOINT ["java","-jar","/app.jar"]
    ```
    
    Replace `<your-jar-file-name>` with the name of your jar file.
    
6.  Save and close the `Dockerfile`.
    
7.  Build the Docker image by running the following command:
    
    
    
    ```
    sudo docker build -t <your-image-name> .
    ```
    
    Replace `<your-image-name>` with the name you want to give your Docker image.
    
8.  Once the image is built, you can check that it was created successfully by running:
    
    `sudo docker images`
    
    This will show a list of all the Docker images that are currently available on your GCP instance.
    

That's it! You've now built a Docker image for your package on your GCP instance.

# Pusing Docker Image into Docker Hub Repository or (If any) Artifactory


1.  Create a Docker Hub account if you don't already have one. You can create an account by going to the [Docker Hub website](https://hub.docker.com/) and following the instructions to sign up.
    
2.  Once you've created your account, log in to Docker Hub using the following command:
    
  
    
    ```
    docker login --username=<your-docker-hub-username>
    ```
    
    Replace `<your-docker-hub-username>` with your Docker Hub username.
    
3.  Tag your Docker image with your Docker Hub repository by running the following command:
    
    
    
    ```
    docker tag <your-image-name> <your-docker-hub-username>/<your-repository-name>:<tag>
    ```
    
    Replace `<your-image-name>` with the name of your Docker image, `<your-docker-hub-username>` with your Docker Hub username, `<your-repository-name>` with the name you want to give your repository, and `<tag>` with the tag you want to give your image (e.g. `latest`).
    
4.  Push your Docker image to Docker Hub by running the following command:
    
    
    ```
    docker push <your-docker-hub-username>/<your-repository-name>:<tag>
    ```
    
    Replace `<your-docker-hub-username>`, `<your-repository-name>`, and `<tag>` with the values you used in step 3.
    
5.  Once the image is pushed, you can check that it was pushed successfully by going to the Docker Hub website and checking your repository.
    

That's it! You've now pushed your Docker image to your Docker Hub repository.

# Docker Hub Repository Creating Procedure

1.  Log in to your Docker Hub account by going to the [Docker Hub website](https://hub.docker.com/) and clicking the "Log In" button in the top-right corner.
    
2.  Once you're logged in, click the "Create Repository" button in the top-right corner.
    
3.  In the "Create Repository" form, enter a name for your repository in the "Repository Name" field. This name must be unique on Docker Hub and can contain lowercase letters, numbers, and hyphens.
    
4.  Select the visibility of your repository. You can choose to make your repository public or private. If you choose private, you'll need to pay for a Docker Hub subscription.
    
5.  (Optional) Add a description for your repository in the "Description" field.
    
6.  (Optional) Add tags to your repository. Tags allow you to give different names to different versions of your images. You can add tags by clicking the "Add Tag" button and entering a tag name.
    
7.  Click the "Create" button to create your repository.
    

That's it! You've now created a Docker Hub repository. You can now push Docker images to this repository using the `docker push` command.
