class Book < ApplicationRecord
  belongs_to :category
  mount_uploader :image, ImageUploader

  validates :title, :presence => true
  validates :title, :uniqueness => true
  validates :description, :presence => true

end
