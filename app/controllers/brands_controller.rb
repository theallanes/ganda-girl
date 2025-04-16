class BrandsController < ApplicationController
  def index
    @brands = Brand.page(params[:page]).per(30)
  end

  def show
    @brand = Brand.includes(:products).find(params[:id])
  end
end
