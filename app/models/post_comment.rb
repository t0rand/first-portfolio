class PostComment < ApplicationRecord
  belongs_to :users
  belongs_to :product

end
