# PG4300 Ruby on Rails - Syllabus book web application
This project is the main exam in our course PG4300 Ruby on Rails on Westerdals Oslo ACT. We got as a task to create a web application using Ruby on Rails. The task was completely open along we followed the demands given by the task. We decided to make a book website where students could register themselves, then create books of interest - both study books and novels. Students can also comment books, rate them and share information about selling the books (between students).

### Heroku link
[Our Heroku page](https://ruby-book-project.herokuapp.com/ "Our Heroku")

## Getting Started
Due to one of the requirements that was to use Docker with this project, it should be quite easy to get it up and running on your own. Just follow these steps.

### Prerequisites
* General knowledge about Docker and how to install this yourself
* System dependencies
..*None, beside Docker dependencies

### Installing
* Download Docker and complete it's installation

#### Configuration
Noone :) 

#### Deployment instructions
To deploy the application on your local machine, use commandpromt/bash to locate your project folder. Tehn make sure port 3000 is free to use, if not change the port in docker-compose.yml. From inside the folder issue these commands
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
```
  docker-compose run web rails db:migrate db:seed
```

#### How to run the test suite
```
  docker-compose run web rails test
```

## Project report
Under comes a description of how we worked with different parts of the project. And the result from this.
* **Database**
In the project we have used postgres database run in own image on our computers and hosted by heroku on the uploaded version. Our tests is ran at a local sqlite database.

![alt text](https://00e9e64bac98adb8c29cea90b4ec594bb90bb2a2f45997288e-apidata.googleusercontent.com/download/storage/v1/b/pg4300grp10b/o/direct-uploads%2Ftable.png?qk=AD5uMEso7pll6lgqaGB3iWkunucUHbUqJOzGuqStOgKHD5vDktcpcaPLVa4gnCwjMDZMg01pOv7nv0Lee5QlbdHZF_d1yAsXsWosxrrp1gqagletbIQT2fFiNrUs70YkugDLcP5QR8omBWOAGoYDnpsK-wuAjFFet757Ta9vlHC-1opDnn7u9Dsbz9YrAb3_ft4dKSG1H3e-u-jBJJjLTJvn0re2bEnhx_VaIFNpuwwNilG7X_CTwJjfKbKYZ9QNpMPFVzUxgTLPfxWANxoIAvvmz68XCq_lnr6yPEzYiXUN432X5ulTaqMPC5vf6F8vNkuEiD_mhQuu0_cVESAIsz7qYOcWLKP_Nh9i67b254TDjkMkwygoJaO_HqqsDA9wSCbvmjQFGEMQDFqgeMvSk4XZM5NEbWNA7rAOpYsxxWg_VbgGKKAGntnJliCce8E0IEWudPfplAZajLF_lSWX8nLfjFC_eIflsAYYXC5ei_INQnJ2JUEBtTiwHrkxnrTQ4gC_Dv5WB5AqyvhMFC-f4XqkwXTrISdihcLoaPKlMdlb38Ii8wO5M4yV7kFiTyALHbW1v5oGsYdJSpULsR1e4rOU5KtFOVNr6r8Irr_j8g5omyg8AfOZUl9Ik8RqanDbnZ_SnDFDVVbAjLFW2lP2BSauKFjVHxw1j_oqjJ3D4i61kJN7d8RudAL5NkQefIRptZKcNiNLKGvxJ3LWdbHPL2K3qMa0uG4UG3dUqlW8tlYi73KKRzQOW2YEKaJ8R3skP0ikbnOLIuP4SzzuYXOtwcHpZ8PGeehIM-fJuLTuVgGoQ83w09J5BJ8 "Database model")
* **Controllers**
We have implementet a total of 9 controllers divived on these 7 tables. The two others is one specialcreated (custom) for welcomepage and one for session.
* **Use of Docker**
From the beginning of the project we decided we wanted both Docker and Heroku up and running on all members computers. Both rails and the postgres database runs as images. This is how our docker-compose.yml looks like:
```
version: '2'
services:
 db:
   image: postgres
 web:
   environment:
     PORT: 3000
   build: .
   container_name: pg4300grp10
   command: bundle exec rails s -p 3000 -b '0.0.0.0'
   volumes:
     - .:/myapp
   ports:
     - "3000:3000"
   depends_on:
     - db
```

* **Use of Heroku**
Same as with Docker, we used Heroku from the beginning. Our Heroku is connected to Git and automatically updates our running version.* AJAX
* **Use of propper CSS**
<write something here>
* **Testing**
We did had fair enough focus on testing, we wanted the test cases to be as good as possible. The model testing went quite good but integration tests and system tests was way more difficult then we thought
* **Login**
* **Session**
<write something here>
* **Different user rights**
We have implmented three different usergroups: user, moderator and admin. 
One example of the diffrence of rights between user and admin is in book/1 (show.html) where only admin can edit a book but everyone can go back
```
  <% if current_admin %>
  <%= link_to 'Edit', edit_book_path(@book) %> |
  <% end %>
  <%= link_to 'Back', _back_url %>
```

## Used libraries/sources/gems
Following is a list over gems and other sources used in our project with a short description of what they have been used for in our project.

### Pagination
Used to limit the number of books shown at frontpage. This example sets the max number of books to 3.
```
class WelcomeController < ApplicationController
  skip_before_action :require_login, :only => [:index]
def index
  @books = Book.search(params[:search]).searchcategories(params[:searchcategories]).paginate(:page => params[:page])
end
  WillPaginate.per_page = 3
end
```

### Carrierwave
Dealing with the imageupload from form to Google Cloud.

### Google-api-client
Due to Heroku working on different dynos, images uploaded by user will be reset on every new upload to Heroku - which will reset all previous updated dato - to prevent this we only save a link in user's table to an imagelocation saved on Google Cloud. The config for that looks like this:
```
CarrierWave.configure do |config|
  config.fog_provider = 'fog/google'
  config.fog_credentials = {
      ...
  }
  config.fog_directory = 'pg4300grp10b'
end
```

### Auto-session-timeout


## Authors
* **Marius Rikheim**
* **Andreas Ødegaard**
* **Thomas René Gabrielsen**

## Licence

## Acknowledgments
