class Book < ApplicationRecord
  belongs_to :category
  mount_uploader :image, ImageUploader

  validates_presence_of :title
  validates_presence_of :description
  validates_uniqueness_of :title

end
