class Product < ActiveRecord::Base
  belongs_to :user
  has_many :product_photos
  has_many :transactions

  # validates_presence_of :product_type
  # validates_presence_of :category
  # validates_presence_of :size
  # validates_presence_of :product_name, length: {maximum: 50}
  # validates_presence_of :description, length: {maximum: 500}
  # validates_presence_of :stock
  # validates_presence_of :code_id
  # validates_presence_of :price

end
