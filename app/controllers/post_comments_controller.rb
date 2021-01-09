class PostCommentsController < ApplicationController
  before_action :authenticate_user!
  #before_action :ensure_correct_user , only: [:destroy]

  def create
    @product = Product.find(params[:product_id])
    @comment = current_user.comments.new(post_comment_params)
    #binding.pry
    @comment.product_id = @product.id
    @comment.save
    #redirect_to products_path(product)
  end

  def destroy
    @comment = PostComment.find_by(id: params[:id], product_id: params[:product_id])
    #binding.pry
    @comment.destroy
    #redirect_to products_path(params[:product_id])
  end

  private
  def post_comment_params
    params.require(:product_comment).permit(:comment)
  end


end
