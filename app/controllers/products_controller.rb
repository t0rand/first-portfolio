class ProductsController < ApplicationController
  before_action :authenticate_user!

  def index
    @products = Product.all
    @makers = Maker.where(is_active: true)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path(@product)
    else
      redirect_back(fallback_location: product_path)
    end
  end

  def show
    @product = Product.find(params[:id])
    @makers = Maker.where(id: @product.maker)
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to product_path(@product)
    else
      render "edit"
    end
  end

  def search
    @makers = Maker.where(is_active: true)
    @value = params['value']
    @maker = Maker.find_by(id: @value)
    @products = Product.where(genre_id: @value, is_active: true).page(params[:page])
  end

  private

  def product_params
    params.require(:product).permit(:maker, :name, :image, :release_date, :is_lens, :is_sales)
  end

end