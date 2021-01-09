class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @product = Product.find(params[:product_id])
    favorite = current_user.favorites.new(product_id: @product.id)
    favorite.save
    #redirect_back(fallback_location: root_path) #⇦行動する前に居た画面に戻る。
  end

  def destroy
    @product = Product.find(params[:product_id])
    favorite = current_user.favorites.find_by(product_id: @product.id)
    favorite.destroy
    #redirect_back(fallback_location: root_path) #⇦行動する前に居た画面に戻る。
  end

end