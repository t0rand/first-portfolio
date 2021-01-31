class Product < ApplicationRecord
  has_many :post_comments
  belongs_to :maker

  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  #rateの平均値を出すメソッド
  def rate
    self.post_comments.average(:rate)
  end

  attachment :image
  validates :name, presence: true
  validates :maker, presence: true
  validates :release_date, presence: true
  validates :is_lens, inclusion: {in: [true, false]}
  validates :is_sales, inclusion: {in: [true, false]}

end