class PostCommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user , only: [:destroy]

  def create
    @product = Product.find(params[:product_id])
    @comment = current_user.post_comments.new(post_comment_params)
    @comment.product_id = @product.id
    #@comment.rate = 3
    @comment.save
    #redirect_to products_path(product)
  end

  def destroy
    @comment = PostComment.find_by(id: params[:id], product_id: params[:product_id])
    # if @comment.user_id != current_user.id
    #   flash[:notice] = "権限がありません"
    #   return
    # end
    @comment.destroy
    #redirect_to products_path(params[:product_id])
  end

  private
  def ensure_correct_user
    return true if current_user.is_admin
    @comment = current_user.post_comments.find_by(id: params[:id])
    unless @comment.present?
      redirect_to user_path(current_user)
    end
  end

  def post_comment_params
    params.require(:post_comment).permit(:comment, :rate)
  end

  # def rate_average
  #   @product = Product.find(params[:product_id])
  #   @comments = @product.PostComment.all
  #   @rate = @product.PostComment.rate
  #   @rate_average = @rate.to_i / @comments.count.to_i
  # end

end
