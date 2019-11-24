# Week 5 Lab Work

> If you find any spelling/grammar errors or inaccuracies, please feel free to submit a PR for any changes you see fit.

It's now come time to ensure that our GitHub account has provided authorization for Travis CI integration. For GitHub to allow Travis to listen for remote changes in order to integrate our changes and ultimately deploy them, we need to do a small amount of administration.

For both platforms to communicate with one another, we will be using a token based system along with OAuth to ensure that the communication is secure. We need to install the Travis CI plugin from GitHub's marketplace and ensure that our assignment repo has granted Travis the correct access permissions. Aside from the access tokens, plugin integration and permissions, we'll also need to ensure that we have our Travis account up and running. Let's start by ensuring that we have our assignment forked and install the Travis CI plugin for our GitHub account.

# Table of Contents
1. [GitHub Integrations & Services](#GitHub-Integrations-&-Services)
2. [Setting Up Travis](#Setting-Up-Travis)
3. [Creating .travis.yml](#Creating-.travis.yml)
4. [Lab Exercise](#Lab-Exercise)

## GitHub Integrations & Services
Before we can do anything, we need to ensure the assignment project is forked. **If you have not yet done that,** please [head over to the assignment repo](https://github.com/jayoharedee/assignment) and fork the project before continuing. **Ensure the assignment project is forked before continuing**.

Once we have the assignment forked, we then have our own personal repository which we can install plugins, attach services and so on. For a service like Travis to work with our forked repository, we need to ensure that the repository has the correct permissions configured. We have a bit of administration work before we can allow Travis to interact with our repo. Travis needs GitHub to permit the following:

* Read access to code
* Read access to metadata and PR's
* Read and write access for adminstration, checks, commit statuses, and deployments

To permit the above operations, Travis offers a GitHub app which can be found in [the marketplace](https://github.com/marketplace/travis-ci). This app in the GitHub Marketplace will take care of all the permissions Travis needs in order to interact with GitHub repositories. You'll want to grant this app access to your GitHub account that contains the forked repository.

> Note: If I am making reference to [the assignment](https://github.com/jayoharedee/assignment) repository and provide a link, I am only using my repo as an example. Make sure you're looking at the assignment repo that you have forked. The url for this would look like github.com/YOURUSERNAME/assignment

Once the application is installed, we can [head on over to the assignment repo](https://github.com/jayoharedee/assignment) and let GitHub know that we'd like the repository to work with Travis. For this to take place, we want to access the repositories settings. You can find this by clicking the *Settings* tab of your repository. Once you've selected the Settings tab of the assignment repo, you should see something similar to what you's below:

![Integration & Sevices, GitHub Setup](https://miro.medium.com/max/4114/1*Fewdg6dpq6MsaBIz9pzOnw.png "Accessing integration and services in our repo")

In the *Integrations & services* section of GitHub, we can find a list of installed applications from the GitHub marketplace. If we haven't yet installed the Travis CI app from [the marketplace](https://github.com/marketplace/travis-ci), we won't see it in our list so **please make sure you have it installed before proceeding**.

After you've installed the app from [Github's marketplace](https://github.com/marketplace/travis-ci) and confirmed it's installed by checking your [account settings](https://github.com/settings/installations/), you'll want to make sure that the app has the aforementioned permissions granted and you've selected which type of repository access you'd like to consent to. Check the [account settings](https://github.com/settings/installations/) page to check what kind of permissions you currently have granted.

You should now see the Travis CI app in your list of installed GitHub apps when accessing the Integration & services area in the settings of your forked assignment. Notice the second installed app in the list below:

![alt text](https://aws1.discourse-cdn.com/business6/uploads/python1/optimized/1X/eb0351545adb8780d4e4555ee5cbdd2fbc8e0200_2_690x278.png "Logo Title Text 1")


## Setting Up Travis
Head on over to [Travis](https://travis-ci.org) and sign in with the GitHub account which you've forked the assignment. **If you have not yet forked the assignment project**, make sure you [head on over to the assignment repo](https://github.com/jayoharedee/assignment) and fork the project before continuing.

Once you've signed up or logged in to Travis with your GitHub account which has the assignment repo forked, accept the authorization of Travis CI if you have not yet done so. You'll then be redirected to GitHub for confirmation. After you've gone through the GitHub OAuth process, you should be presented with the following inside your Travis account.

![Travis Authorization](https://web.dev/using-bundlesize-with-travis-ci/travis-ci.png "Authorizing Travis and GitHub")

In the repositories section of Travis, ensure that you click the green *Activate* button. After we've selected the activate button in Travis, we then have to select the repository which we'd like Travis to interface with (if you have already not done so in GitHub). For the purpose of this course, we'll be using our assignment repo. **Please activate the assignment repo**. Once the assignment repo has been activated for Continuous Integration, we'll be able to create our configuration file to instruct Travis on how we'd like our application built and deployed.

If you didn't manually configure the forked assignment repo for Travis builds, we can actually do it from Travis *as long as we've installed the GitHub App and signed in with our account containing the forked assignment repo.* If you've gone through the OAuth process, you should see a list of your repo's resembling what's seen below:

![alt text](https://hackernoon.com/hn-images/1*7YlO8zdRr0S5H-COOzOxEQ.png "Logo Title Text 1")

Conveniently, Travis provides the UI to toggle which repo we'd like to interact with. Find the assignment repo in your list of repositories and ensure it's toggled. Once the repo is toggled, we can now run builds on it. For builds to run, Travis needs to know what to do. How Travis is instructed to run builds is through a hidden configuration file called `.travis.yml`.


## Creating .travis.yml
Travis follows instructions defined in `.travis.yml` **this file must live in the root of your project directory.**. YML stands for "YAML Ain't Markup Language;". Think of the problems JSON solved that XML imposed with configuration files. XML was nasty key/value pairs in a cumbersome bracket syntax.  JSON is essentialy JS objects, if you don't know, JSON stands for JavaScript Object Notation. Think of a JS Object with it's key/value format and now remove the brackets and quotes. Introduce some whitespace along with dashes and we now have YML.

For more information on YML itself you can read about it [here](https://filext.com/file-extension/YML). I'd recommend ensuring when you're working with YML files you have an IDE configured with an extension to lint out any syntactical errors. Personally, I use [this one](https://marketplace.visualstudio.com/items?itemName=redhat.vscode-yaml) to get the job done.

> Before completing the following, ensure that you have created a branch called travis-config and checked it out **so you are not working on master. REMEMBER:** all git commands can be found in lab 2's course material on black board

Alright so now we want to ensure we have a `.travs.yml` file in our assignment's root directory. If you're not sure how that's done, enter the root directory of your forked assignment and run the touch command like so:

````sh
# ensure you're in the root of your assignment directory 
$ touch .travis.yml
````

Open up the file and fill it with the following:

````yml
language: node_js

node_js:
  - "10.9.0"

cache: npm

before_install:
  - ls -la
````

Please take extra notice of that last block of YML above. The key is titled `before_install`. This is known as a job lifecycle. If you've worked with Angular, .NET or PHP, you may have seen them in the form of *lifecycle hooks*. A lifecycle hook is the ability to catch a particular phase of an operation. For instance, in Angular, there is an ngInit. Lifecycle hooks provide interaction with key life moments of some kind of process.

Using Travis for example, we know that it's going to spin up a temporary server which will build our application. For us to be able to hook in to different phases of the applications build process, Travis provides special syntax for us to access that moment in build time.

Using the `before_install` key as an example, we can instruct Travis to perform something on the temporary servers command line *before* it builds the application. Using the example of the above YML chunk, it would run a list operation on the server *before install*'ing the application.

We're going to end our introduction to the `.travis.yml` there. What we'll want to do next is ensure we have the above yml snippet pushed to the assignment repository we forked.

## Lab Exercise
1. Create a branch from a fresh copy of master. Make sure you run a `git pull` on the master branch of your forked assignment. After you've verified that you're up-to-date, create a branch called `travis-config` and check it out. (remember the commands to perform these git operations can be found in our Lab 2 course material on Blackboard.)
2. Now that you're on the branch, we are going to create a file called .travis.yml
3. Open the file and fill it with YML snippet found in the above section
4. Git add and commit these changes. 
5. Push them upstream to your course repository

After you've done this, please copy you're yml file to [your student folder in the course-material repo](https://github.com/jayoharedee/course-material/tree/master/students). Before pushing the YML file upstream, please ensure it includes a comment at the top of the file with your GitHub URL. Comments in YML are the same as bash. They start with a #.

[To provide an example](https://github.com/jayoharedee/course-material/blob/week-05/students/100721000/week-5/.travis.yml), my student folder would contain a folder called week-5 containing my travis file. Check the link out for an example.


