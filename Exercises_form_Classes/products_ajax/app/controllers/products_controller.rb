class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to products_path
    else
      render :edit
    end
  end

  def destroy
    product = Product.find(params[:id])
    if product.destroy
      redirect_to products_path
    else
      redirect_to products_path
    end
  end

  def form_template
    render partial: 'form'
  end

  private

    def product_params
      params.require(:product).permit(:id, :name, :base_price, :description, :quantity_on_hand, :color, :weight, :other_attributes)
    end

end
