class Book < ApplicationRecord
  belongs_to :category
  validates :title, :presence => true
  validates :title, :uniqueness => true
  validates :description, :presence => true
end
