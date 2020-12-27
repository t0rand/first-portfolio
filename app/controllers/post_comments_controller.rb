class PostCommentsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    @comment = current_user.comments.new(post_comment_params)
    @comment.product_id = @product.id
    @comment.save
    #redirect_to book_path(book)
  end

  def destroy
    @comment = PostComment.find_by(id: params[:id], product_id: params[:product_id])
    #binding.pry
    @comment.destroy
    #redirect_to book_path(params[:book_id])
  end

  private
  def post_comment_params
    params.require(:product_comment).permit(:comment)
  end


end
