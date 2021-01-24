class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]
  before_action :author_correct_user, only: [:new, :create, :edit, :update]

  def index
    #@product = Product.find(params[:id])
    #@maker = Maker.find_by(id: @product.maker_id)
    #@products = Product.all
    @makers = Maker.where(is_active: true)
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true)

    # @post_comment = PostComment.find_by(id: @product.id)
    # @comments = @product.post_comment.all
    # @rate = @products.PostComment.rate
    @product_rate = PostComment.where(product_id: @q.id)
    @rate = @product_rate.average(:rate)
    # binding.pry
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
    @products = Product.all
    @maker = Maker.find_by(id: @product.maker_id)
    @post_comment = PostComment.new
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


  private

  def author_correct_user
    return true if current_user.is_admin
    @user = User.find(params[:id])
      unless @user.is_admin
        redirect_to "index"
      end
  end

  def product_params
    params.require(:product).permit(:maker_id, :name, :introduction, :image, :release_date, :is_lens, :is_sales)
  end

end