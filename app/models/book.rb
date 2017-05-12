class Book < ApplicationRecord
  belongs_to :category
  has_many :ratings
  has_many :comments
  mount_uploader :image, BookUploader

  validates_presence_of :title
  validates_presence_of :description
  validates_uniqueness_of :title

end
