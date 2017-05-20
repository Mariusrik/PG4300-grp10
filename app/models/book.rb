class Book < ApplicationRecord
  belongs_to :category
  has_many :ratings, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :for_sales, dependent: :destroy
  mount_uploader :image, BookUploader

  validates_presence_of :title, :description
  validates_uniqueness_of :title

end
