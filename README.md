# PG4300 Ruby on Rails - Syllabus book web application
This project is the main exam in our course PG4300 Ruby on Rails on Westerdals Oslo ACT. We got as a task to create a web application using Ruby on Rails. The task was completely open along we followed the demands given by the task. We decided to make a book website where students could register themselves, then create books of interest - both study books and novels. Students can also comment books, rate them and share information about selling the books (between students).

## Getting Started
Due to one of the requirements that was to use Docker with this project, it should be quite easy to get it up and running on your own. Just follow these steps.

### Prerequisites

* Ruby version
none?

* System dependencies
None, beside docker dependencies? https://www.docker.com/community-edition

<write something here about how to install docker?>

### Installing

#### Configuration

* Database creation
```
  docker-compose run web rails db:create
```

* Database initialization
```
  docker-compose run web rails db:migrate db:seed
```

* How to run the test suite
```
  docker-compose run web rails test
```

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

## Built with

## Authors
* **Marius Rikheim**
* **Andreas Ødegaard**
* **Thomas René Gabrielsen**

## Licence

## Acknowledgments
