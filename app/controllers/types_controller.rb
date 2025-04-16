class TypesController < ApplicationController
  def index
    @types = Type.page(params[:page]).per(30)
  end

  def show
    @type = Type.includes(:products).find(params[:id])
  end
end
