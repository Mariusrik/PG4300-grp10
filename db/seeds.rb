# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
categories_list = [
    'Java',
    'Ruby on Rails',
    'Android',
    'HTML',
    'Javascript',
    'C++',
    'C#'
]

books_list = [
    ['Learning JavaEE7', 'Book about JavaEE7', 'java.img', 1 ],
    ['The Android Ranch', 'Book about Android development', 'android.img', 3],
    ['Agile web development with Ruby on Rails', 'Book about Ruby development', 'ruby.img', 2],
    ['Javascript is the new Stuff', 'Book about Javascript', 'js.img', 5],
    ['Developing with C#', 'C# development guide', 'csharp.img', 7]
]

users_list = [
    ['Nils', 'nils@gmail.com', 'nilserbest'],
    ['Jonas', 'jonascoolman@gmail.com', 'sommer1969'],
    ['Lise', 'lise_l@hotmail.com', 'k0s3b4ms3'],
    ['Ronny', 'tanks66@gmail.com', 'Sprettert123']
]

ratings_list = [
    [5, 2, 1],
    [3, 1, 1],
    [6, 3, 2],
    [4, 1, 2],
    [5, 5, 3],
    [6, 1, 3],
    [3, 4, 4],
    [5, 3, 4]
]

categories_list.each do |name|
  Category.create( name: name )
end

books_list.each do |title, description, image, category_id|
  Book.create( title: title, description: description, image: image, category_id: category_id )
end

users_list.each do |name, email, password_digest|
  User.create(name: name, email: email, password_digest: password_digest)
end

ratings_list.each do |score, book_id, user_id|
  Rating.create(score: score, book_id: book_id, user_id: user_id)
end