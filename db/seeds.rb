# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
categories_list = [
    [1, 'Java'],
    [2, 'Ruby on Rails'],
    [3, 'Android'],
    [4, 'HTML'],
    [5, 'Javascript'],
    [6, 'C++'],
    [7, 'C#']
]

books_list = [
    [1, 'Learning JavaEE7', 'Book about JavaEE7', 'java.img', 1 ],
    [2, 'The Android Ranch', 'Book about Android development', 'android.img', 3],
    [3, 'Agile web development with Ruby on Rails', 'Book about Ruby development', 'ruby.img', 2],
    [4, 'Javascript is the new Stuff', 'Book about Javascript', 'js.img', 5],
    [5, 'Developing with C#', 'C# development guide', 'csharp.img', 7]
]

users_list = [
    [1, 'Nils', 'nils@gmail.com', 'nilserbest'],
    [2, 'Jonas', 'jonascoolman@gmail.com', 'sommer1969'],
    [3, 'Lise', 'lise_l@hotmail.com', 'k0s3b4ms3'],
    [4, 'Ronny', 'tanks66@gmail.com', 'Sprettert123']
]

ratings_list = [
    [1, 5, 2, 1],
    [2, 3, 1, 1],
    [3, 6, 3, 2],
    [4, 4, 1, 2],
    [5, 5, 5, 3],
    [6, 6, 1, 3],
    [7, 3, 4, 4],
    [8, 5, 3, 4]
]

categories_list.each do |categoryId, name|
  Category.create( categoryId: categoryId, name: name )
end

books_list.each do |bookId, title, description, image, category_id|
  Book.create( bookId: bookId, title: title, description: description, image: image, category_id: category_id )
end

users_list.each do |userId, name, email, password|
  User.create(userId: userId, name: name, email: email, password: password)
end

ratings_list.each do |ratingId, score, book_id, user_id|
  Rating.create(ratingId: ratingId, score: score, book_id: book_id, user_id: user_id)
end