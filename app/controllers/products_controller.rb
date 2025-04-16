class ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).per(30).search(params[:search], params[:brand_id])
  end

  def show
    @product = Product.includes(:brand, :type).find(params[:id])
  end
end
