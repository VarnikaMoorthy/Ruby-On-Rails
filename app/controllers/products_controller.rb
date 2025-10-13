class ProductsController < ApplicationController
  def index
    @products = Product.all
    @message = "Welcome to Ecommerce Store!"
  end
  
  def show
  @product = Product.find(params[:id])
end

end
