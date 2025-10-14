class ProductsController < ApplicationController
  require 'ostruct'

  # Load product for actions that need it
  before_action :set_product, only: [:show, :edit, :update, :destroy, :buy, :purchase]

  # require login for any actions that modify data or show forms
  before_action :require_login, only: [:new, :create, :edit, :update, :destroy]


  # GET /products
  # List all products (limit 20)
  def index
    @products = Product.limit(20)
  end

  # GET /products/:id
  # Show a single product
  def show
  end

  # GET /products/new
  # Show form to create a new product
  def new
    @product = Product.new
  end

  # POST /products
  # Create a new product
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product, notice: "Product created successfully."
    else
      render :new
    end
  end

  # GET /products/:id/edit
  # Show form to edit a single product
  def edit
  end

  # PATCH/PUT /products/:id
  # Update a product
  def update
    if @product.update(product_params)
      redirect_to products_path, notice: "Product updated successfully."
    else
      render :edit
    end
  end

  # DELETE /products/:id
  # Delete a product
  def destroy
    @product.destroy
    redirect_to products_path, notice: "Product deleted successfully."
  end

  # GET /products/:id/buy
  # Show Buy form for a product
  def buy
    @order = OpenStruct.new # temporary object to hold form data
  end

  # POST /products/:id/purchase
  # Process order placement
  def purchase
    quantity = params[:order][:quantity].to_i
    if quantity <= 0 || quantity > @product.stock
      redirect_to buy_product_path(@product), alert: "Invalid quantity."
      return
    end

    # Reduce stock
    @product.update(stock: @product.stock - quantity)

    # Show success message
    redirect_to products_path, notice: "Order placed successfully for #{quantity} #{@product.name}(s)!"
  end

  private

  # Set @product based on id
  def set_product
    @product = Product.find(params[:id])
  end

  # Strong parameters for product
  def product_params
    params.require(:product).permit(:name, :description, :price, :stock, :image)
  end
end
