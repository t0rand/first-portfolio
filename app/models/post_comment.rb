class PostComment < ApplicationRecord

  belongs_to :user
  belongs_to :product

  # if @comment.can_destroy?
  def can_destroy?(current_user)
    return true if current_user.is_admin # true or false
    self.user == current_user # true or false
  end

end