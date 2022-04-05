<p align="center">
<!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
[![All Contributors](https://img.shields.io/badge/all_contributors-1-orange.svg?style=flat-square)](#contributors-)
<!-- ALL-CONTRIBUTORS-BADGE:END -->
  <img src="https://user-images.githubusercontent.com/88853324/161361762-58350194-9b14-47b0-afc2-48632ef04d51.png">
</p>


# Mod4 Group Project: One Minute Writer


## Table of Contents
- <a href="#getting-started">Getting Started</a>
- <a href="#project-description">Project Description</a>
- <a href="#learning-goals-for-project">Learning Goals for Project</a>
- <a href="#setup">Setup</a>
- <a href="#testing">Testing</a>
- <a href="#graphql-queries-and-mutations">GraphQL Queries and Mutations</a>
- <a href="#references">References</a>
- <a href="#contributors">Contributors</a>

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
   
## GraphQL Queries and Mutations

----------

## Reference:

[Project Specs and Overview](https://mod4.turing.edu/projects/capstone/expectations.html)

----------

## Collaborators


## Contributors ✨

Thanks goes to these wonderful people ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tr>
    <td align="center"><a href="https://github.com/JCNapier"><img src="https://avatars.githubusercontent.com/u/81737385?v=4?s=100" width="100px;" alt=""/><br /><sub><b>John Napier</b></sub></a><br /><a href="https://github.com/one-minute-writer/one_minute_writer_be/commits?author=JCNapier" title="Code">💻</a> <a href="https://github.com/one-minute-writer/one_minute_writer_be/commits?author=JCNapier" title="Documentation">📖</a> <a href="#design-JCNapier" title="Design">🎨</a> <a href="#ideas-JCNapier" title="Ideas, Planning, & Feedback">🤔</a> <a href="https://github.com/one-minute-writer/one_minute_writer_be/pulls?q=is%3Apr+reviewed-by%3AJCNapier" title="Reviewed Pull Requests">👀</a> <a href="#projectManagement-JCNapier" title="Project Management">📆</a></td>
    <td align="center"><a href="https://github.com/kevingloss"><img src="https://avatars.githubusercontent.com/u/83426676?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Kevin Gloss</b></sub></a><br /><a href="https://github.com/one-minute-writer/one_minute_writer_be/commits?author=kevingloss" title="Code">💻</a> <a href="https://github.com/one-minute-writer/one_minute_writer_be/commits?author=kevingloss" title="Documentation">📖</a> <a href="#design-kevingloss" title="Design">🎨</a> <a href="#ideas-kevingloss" title="Ideas, Planning, & Feedback">🤔</a> <a href="#infra-kevingloss" title="Infrastructure (Hosting, Build-Tools, etc)">🚇</a> <a href="https://github.com/one-minute-writer/one_minute_writer_be/pulls?q=is%3Apr+reviewed-by%3Akevingloss" title="Reviewed Pull Requests">👀</a> <a href="#projectManagement-kevingloss" title="Project Management">📆</a></td>
    <td align="center"><a href="https://github.com/dylan-harper"><img src="https://avatars.githubusercontent.com/u/39470230?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Dylan Harper</b></sub></a><br /><a href="https://github.com/one-minute-writer/one_minute_writer_be/commits?author=dylan-harper" title="Code">💻</a> <a href="https://github.com/one-minute-writer/one_minute_writer_be/commits?author=dylan-harper" title="Documentation">📖</a> <a href="#design-dylan-harper" title="Design">🎨</a> <a href="#ideas-dylan-harper" title="Ideas, Planning, & Feedback">🤔</a> <a href="#infra-dylan-harper" title="Infrastructure (Hosting, Build-Tools, etc)">🚇</a> <a href="https://github.com/one-minute-writer/one_minute_writer_be/pulls?q=is%3Apr+reviewed-by%3Adylan-harper" title="Reviewed Pull Requests">👀</a> <a href="#projectManagement-dylan-harper" title="Project Management">📆</a></td>
  </tr>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification.
