class ForSale < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates_presence_of :price, :contact
  validates_length_of :price, :maximum => 99999
  validates_length_of :contact, :maximum => 255
end
