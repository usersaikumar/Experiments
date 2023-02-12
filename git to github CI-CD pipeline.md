> Sample Project: Complete Git to GitHub CI/CD Pipeline
> =====================================================
> 
> 1\. Set up a Git repository
> ---------------------------
> 
> 1.  Create a new project directory and navigate into it:
>     
>     shell
>     
>     ```shell
>     $ mkdir sample-project && cd sample-project
>     ```
>     
> 2.  Initialize a Git repository:
>     
>     csharp
>     
>     ```csharp
>     $ git init
>     ```
>     
> 3.  Create a file called `index.html` with some basic HTML content:
>     
>     php
>     
>     ```php
>     $ echo '<html><head><title>Sample Project</title></head><body><h1>Hello, World!</h1></body></html>' > index.html
>     ```
>     
> 4.  Add the file to the Git repository and make an initial commit:
>     
>     sql
>     
>     ```sql
>     $ git add index.html && git commit -m "Initial commit"
>     ```
>     
> 
> 2\. Create a GitHub repository
> ------------------------------
> 
> 1.  Go to the GitHub website and create a new repository.
>     
> 2.  Copy the repository's HTTPS URL.
>     
> 
> 3\. Connect the Git repository to the GitHub repository
> -------------------------------------------------------
> 
> 1.  Add the GitHub repository as a remote to the Git repository:
>     
>     csharp
>     
>     ```csharp
>     $ git remote add origin <repository HTTPS URL>
>     ```
>     
> 2.  Push the initial commit to the GitHub repository:
>     
>     perl
>     
>     ```perl
>     $ git push -u origin master
>     ```
>     
> 
> 4\. Set up a GitHub Actions workflow
> ------------------------------------
> 
> 1.  Go to the GitHub repository's "Actions" tab.
>     
> 2.  Click on the "Set up a workflow yourself" button.
>     
> 3.  Create a file called `.github/workflows/ci.yml` with the following content:
>     
> 
> yaml
> 
> ```yaml
> name: CI
> 
> on:
>   push:
>     branches:
>       - master
> 
> jobs:
>   build:
>     runs-on: ubuntu-latest
> 
>     steps:
>     - name: Checkout code
>       uses: actions/checkout@v2
> 
>     - name: Install dependencies
>       run: |
>         echo "Nothing to install"
>     - name: Build project
>       run: |
>         echo "Nothing to build"
>     - name: Test project
>       run: |
>         echo "No tests to run"
> ```
> 
> 4.  Commit the file and push it to the GitHub repository:
>     
>     shell
>     
>     ```shell
>     $ git add .github/workflows/ci.yml && git commit -m "Add GitHub Actions workflow" && git push
>     ```
>     
> 
> 5\. Verify the GitHub Actions workflow
> --------------------------------------
> 
> 1.  Go to the GitHub repository's "Actions" tab.
>     
> 2.  Verify that the workflow has been triggered and ran successfully.
>     
> 
> 6\. Set up a GitHub Pages site
> ------------------------------
> 
> 1.  Go to the GitHub repository's "Settings" tab.
>     
> 2.  Scroll down to the "GitHub Pages" section.
>     
> 3.  Select the "master branch" as the source.
>     
> 4.  Verify that the GitHub Pages site has been set up and is accessible.
>     
> 
> 7\. Set up a GitHub Actions workflow for deploying to GitHub Pages
> ------------------------------------------------------------------
> 
> 1.  Create a file called `.github/workflows/deploy.yml` with the following content:
> 
> yaml
> 
> ```yaml
> name: Deploy
> 
> on:
>   push:
>     branches:
>       - master
> 
> jobs:
>   deploy:
>     runs-on: ubuntu-latest
>
> steps:
>     - name: Checkout code
>       uses: actions/checkout@v2
> 
>     - name: Install dependencies
>       run: |
>         echo "Nothing to install"
>     - name: Build project
>       run: |
>         echo "Nothing to build"
>     - name: Deploy to GitHub Pages
>       uses: JamesIves/github-pages-deploy-action@v3
>       with:
>         ACCESS_TOKEN: ${{ secrets.ACCESS_TOKEN }}
>         BRANCH: gh-pages
>         FOLDER: ./
>         CLEAN: true
>         COMMIT_MESSAGE: "Automated deployment"
> ```
> 
> 8.  Commit the file and push it to the GitHub repository:
>     
>     shell
>     
>     ```shell
>     $ git add .github/workflows/deploy.yml && git commit -m "Add deploy workflow" && git push
>     ```
>     
> 
> 8\. Verify the GitHub Actions workflow for deploying to GitHub Pages
> --------------------------------------------------------------------
> 
> 1.  Go to the GitHub repository's "Actions" tab.
>     
> 2.  Verify that the workflow has been triggered and ran successfully.
>     
> 3.  Verify that the changes to the `index.html` file have been deployed to the GitHub Pages site.
>     
> 
> And that's it! You now have a complete Git to GitHub CI/CD pipeline that automatically builds and tests your code, and then deploys your changes to GitHub Pages.
