class Rating < ApplicationRecord
  belongs_to :book
  belongs_to :user
  validates_presence_of :score, :user_id, :book_id
end
