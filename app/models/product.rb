class Product < ApplicationRecord
  has_many :post_comments
  belongs_to :maker

end