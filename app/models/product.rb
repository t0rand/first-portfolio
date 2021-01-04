class Product < ApplicationRecord
  has_many :post_comments
  belongs_to :maker

  attachment :image
  validates :name, presence: true
  validates :maker, presence: true
  validates :release_date, presence: true
  validates :is_lens, inclusion: {in: [true, false]}
  validates :is_sales, inclusion: {in: [true, false]}

end