# PG4300 Ruby on Rails - Syllabus book web application
This project is the main exam in our course PG4300 Ruby on Rails on Westerdals Oslo ACT. We got as a task to create a web application using Ruby on Rails. The task was completely open along we followed the demands given by the task. We decided to make a book website where students could register themselves, then create books of interest - both study books and novels. Students can also comment books, rate them and share information about selling the books (between students).

### Heroku link
[Our Heroku page](https://ruby-book-project.herokuapp.com/ "Our Heroku")

###
Login to users

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

#### How to run the tests
```
  docker-compose run web rails test
```

## Project report
Under comes a description of how we worked with different parts of the project. And the result from this.

* **Database**
In the project we have used postgres database run in own image on our computers and hosted by heroku on the uploaded version. Our tests is ran at a local sqlite database.

![alt text](https://00e9e64bac702135f6c789d4a40b1fd8da6743049265001015-apidata.googleusercontent.com/download/storage/v1/b/pg4300grp10b/o/direct-uploads%2Ftable.png?qk=AD5uMEu6I1pIjXS6xrjX63oomMuDDkUtasc_V-089HYkKZSyphPB-cW3sGnPATuAPUkrHQ5ZpmMIBsTVYEIz4bgEM5HFbKMfTHzf0M4HYS-wBJJ0xLf_qN_mcUQtH5TZyKD5mjO47sSaR1VS3zP0MGCSJadKaWVV9NJ8lkmKZH0-MktO9-rDtBrQdEjYswS3JQevNV43zfnIsVsL6_cHYYu-2plsTX5KdZRlMgsOO8oFdlEtioCvQxmk4ZonlkZyRZFkLcrXjevcDInzrFg86WO3p5XJkycj8H2Nrf-fg0ImBOp_YpMR7C9IHSdcP1Mg8MLyqtaHLw10fRTjeabz-Qs-dAPqstnjRIJ5Rza6a7DDllAxi8lf9hvETeha5iKl4sfmt_RTT3DznwCeqm0eJ-jf-DtAmOZfE7w1Cx2eOtRCFpu-wAayA4wiydm-M-7rCnntis2HoiwW47JSK4v9spUm7BU0KIwAg1KrIHzlXEaswNMS7ALW84If7wxrhPTp_jzoP1Ks6rAU-2FYKQkvvlM9UQULHxo_iBLvdUD_c9P_CbtA0gPwV6du6uoe83gwFW67ZJUTS9RTyR3Sja6tBvToP0hxyg_S4Sn9xk7TR3ofgdGuhikWTOeREYxL-BfTI6WVdOBS8xZ-Vc-Qfp4VACGFemgy_f_d6upXhoKjBPwTW1Q9ex62ZpYnn_5JQLeELhmBBvqXsXrMaViSeZPNf16EGqWzHlgyvhX5tGsKq3OYtOx5IayRMW568UKZOLZSsuitIA2HW-aoOufjBdK1XqUF2QC1JwAB8FhmAQbQ8YO-feohUIQaDOA "Database model")
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
something
* **Testing**
We did had fair enough focus on testing, we wanted the test cases to be as good as possible. The model testing went quite good but integration tests and system tests was way more difficult then we thought
* **Login**
* **Session**
something
* **Different user rights**
We have implmented three different usergroups: user, moderator and admin. 
One example of the diffrence of rights between user and admin is in book/1 (show.html) where only admin can edit a book but everyone can go back
```
  <% if current_admin %>
  <%= link_to 'Edit', edit_book_path(@book) %> |
  <% end %>
  <%= link_to 'Back', _back_url %>
```
* **Search**
We have implemented a searchfunction that allows you to search for books based on title. This search is not case-sensitive. The results will show on the frontpage.

* **Categories has and belongs to many books**
A book must have one and can have many categories, meanwhile a category can have many books. This creates a many-to-many relationship which we solved in the following way:
```
schema.rb:
  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
  create_table "books_categories", id: false, force: :cascade do |t|
    t.bigint "book_id", null: false
    t.bigint "category_id", null: false
    t.index ["book_id", "category_id"], name: "index_books_categories_on_book_id_and_category_id"
    t.index ["category_id", "book_id"], name: "index_books_categories_on_category_id_and_book_id"
  end
  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
  ```

* **Validation**
All models has been given validations. These focus on a width specter of validations, from length and uniqueness to format and confirmation. Example on this is:
```
class Book < ApplicationRecord
  ...
  validates_presence_of :title, :description, :categories
  validates_uniqueness_of :title
  validates_length_of :title, :maximum => 80
```
* **Anything else we wanna describe short?**


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
