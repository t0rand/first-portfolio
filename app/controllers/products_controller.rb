class ProductsController < ApplicationController

  def index
    @makers = Maker.where(is_active: true)
    @products = Product.where(is_active: true, product_id: @makers.ids).page(params[:page])
  end

  def show
    @product = Product.find(params[:id])
    @makers = Maker.where(is_active: true)
  end

  def search
    @makers = Maker.where(is_active: true)
    @value = params['value']
    @maker = Maker.find_by(id: @value)
    @products = Product.where(genre_id: @value, is_active: true).page(params[:page])
  end

end
