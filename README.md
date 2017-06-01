# PG4300 Ruby on Rails - Syllabus book web application
This project is the main exam in our course PG4300 Ruby on Rails on Westerdals Oslo ACT. We got as a task to create a web application using Ruby on Rails. The task was completely open along we followed the demands given by the task. We decided to make a book website where students could register themselves, then create books of interest - both study books and novels. Students can also comment books, rate them and share information about selling the books (between students).

### Heroku link


## Getting Started
Due to one of the requirements that was to use Docker with this project, it should be quite easy to get it up and running on your own. Just follow these steps.

### Prerequisites

* Ruby version
none?

* System dependencies
None, beside docker dependencies? https://www.docker.com/community-edition

<write something here about how to install docker?>

### Installing

_Step by step explanation_

#### Configuration
<what here?>

#### Deployment instructions
To deploy the application on your local machine, use commandpromt/bash to locate your project folder. From inside issue these commands
```
  docker-compose build
```
Following a successfull build, run 
```
  docker-compose up
```

#### Database creation
The following command needs to be ran from another prompt than where the docker-images was ran, but still from inside the project folder.
```
  docker-compose run web rails db:create
```

#### Database initialization
The following commands needs to be ran from another prompt than where the docker-images was ran.
```
  docker-compose run web rails db:migrate db:seed
```

#### How to run the test suite
The following commands needs to be ran from another prompt than where the docker-images was ran.
```
  docker-compose run web rails test
```

#### Services (job queues, cache servers, search engines, etc.)

## Project report

## Used libraries/sources/gems
Following is a list over gems and other sources used in our project with a short description of what they have been used for in our project.

### Pagination

### Carrierwave

### Google-api-client
Due to Heroku working on different dynos, images uploaded by user will be reset on every new upload to Heroku - which will reset all previous updated dato - to prevent this we only save a link in user's table to an imagelocation saved on Google Cloud. The config for that looks like this:
```
CarrierWave.configure do |config|
  config.fog_provider = 'fog/google'
  config.fog_credentials = {
      provider:                         'Google',
      google_storage_access_key_id:     'GOOGPJRH353G2A3YSD7P',
      google_storage_secret_access_key: 'IP+yB1m1MoEq4kP1hsOYVu8AChwQkarHiu9i18MZ'
  }
  config.fog_directory = 'pg4300grp10b'
end
```

### Mechanize

### Auto-session-timeout


## Authors
* **Marius Rikheim**
* **Andreas Ødegaard**
* **Thomas René Gabrielsen**

## Licence

## Acknowledgments
