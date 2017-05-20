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
    ['Learning JavaEE7', 'Book about JavaEE7', 'java.img', [1] ],
    ['The Android Ranch', 'Book about Android development', 'android.img', [1, 3]],
    ['Agile web development with Ruby on Rails', 'Book about Ruby development', 'ruby.img', [2, 4, 5]],
    ['Javascript is the new Stuff', 'Book about Javascript', 'js.img', [4, 5] ],
    ['Developing with C#', 'C# development guide', 'csharp.img', [7, 6] ]
]

users_list = [
    ['Nils', 'nils@gmail.com', 'nilserbest1', 'admin'],
    ['Jonas', 'jonascoolman@gmail.com', 'sommer1969', 'user'],
    ['Lise', 'lise_l@hotmail.com', 'k0s3b4ms3', 'user'],
    ['Ronny', 'tanks66@gmail.com', 'Sprettert123', 'user'],
    ['Per', 'per@gmail.com', 'pererbest1', 'moderator']
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

comments_list = [
    [1, 1, 'Cool book'],
    [4, 3, 'Horrible book'],
    [1, 1, 'Great way to learn java enterprise!']
]

forSale_list = [
    [1, 1, 300, 'Contact me at mail nils@gmail.com'],
    [1, 2, 299, 'Text me at number: 12345678'],
    [4, 3, 800, 'Contact at: lise_l@hotmail.com']
]

categories_list.each do |name|
  Category.create( name: name )
end

books_list.each do |title, description, image, categories |
  Book.create( title: title, description: description, image: image, category_ids: categories )

end

users_list.each do |name, email, password_digest, user_profile|
  User.create(name: name, email: email, password_digest: password_digest, user_profile: user_profile)
end

ratings_list.each do |score, book_id, user_id|
  Rating.create(score: score, book_id: book_id, user_id: user_id)
end

comments_list.each do |book_id, user_id, content|
  Comment.create(book_id: book_id, user_id: user_id, content: content)
end

forSale_list.each do |book_id, user_id, price, contact|
  ForSale.create(book_id: book_id, user_id: user_id, price: price, contact: contact)
end