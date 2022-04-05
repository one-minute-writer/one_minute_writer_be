<p align="center">
  <img src="https://user-images.githubusercontent.com/88853324/161361762-58350194-9b14-47b0-afc2-48632ef04d51.png">
</p>


# Mod4 Group Project: One Minute Writer


## Table of Contents
- [Getting Started]()
- [Project Description]()
- [Learning Goals for Project]()
- [GraphQL Queries & Mutations]()
- [Setup]()
- [Testing]()
- [Collaborators]()

----------

## Getting Started

### Versions

- Ruby 2.7.2
- Rails 5.2.7

----------

## Project Description

One minute writer is for creatives who are seeking inspiration and a space to document and organize their ideas and writing. They can track their progress through metrics on a user dashboard as well as revisit and edit past writings. This app was built with a cross-function team of 8 developers as the capstone project for graduation from the Turing School of Software and Design.

## Learning Goals for Project:

- Demonstrate knowledge gained throughout Turing
- Use an agile process to turn well defined requirements into deployed and production ready software
- Gain experience dividing applications into components and domains of responsibilities to facilitate multi-developer teams.
- Explore and implement new concepts, patterns, or libraries that have not been explicitly taught while at Turing.
  - Backend: GraphQL and a Python Microservice
- Practice an advanced, professional git workflow utilizing rebasing and including a Pull Request Reviews.
- Gain experience using continuous integration tools to build and automate the deployment of features
- Build applications that execute in development, test, CI, and production environments
- Focus on communication between front-end and back-end teams in order to complete and deploy features that have been outlined by the project spec

----------
## Setup
1. Fork and/or Clone this Repo from GitHub.
2. In your terminal use `$ git clone <ssh or https path>`
3. Change into the cloned directory using `$ cd one_minute_writer_be`
4. Install the gem packages using `$ bundle install`
5. Database Migrations can be setup by running:
```shell
$ rails rake db:{drop,create,migrate,seed}
```

## Testing
 - Test using the terminal utilizing RSpec
 ```shell
 $ rspec spec/<follow directory path to test specific files>
 ```
   or test the whole suite with `$ rspec`
- Alternatively you can test in GraphiQL interactively
  - Start Server
```shell
$ rails s
```
 - Open Web Broswer and visit `http://localhost:3000/graphiql`
   - Enter queries or mutations for users and stories
   - Please visit below graphql notes to see examples
----------
   
## GraphQL Queries & Mutations

----------

## Reference:

[Project Specs and Overview](https://mod4.turing.edu/projects/capstone/expectations.html)

----------

## Collaborators
