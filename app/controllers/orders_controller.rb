class OrdersController < ApplicationController
  before_action :set_product, only: [:new, :create]

  def new
    @order = Order.new
  end

  def create
    quantity = params[:order][:quantity].to_i
    if quantity <= 0 || quantity > @product.stock
      redirect_to new_order_path(product_id: @product.id), alert: "Invalid quantity."
      return
    end

    # Create order (for simplicity, assuming a single user for now)
    @order = Order.create(user_id: 1, status: :completed) # Replace 1 with current_user.id if using authentication
    @order.order_items.create(product: @product, quantity: quantity)

    # Reduce product stock
    @product.update(stock: @product.stock - quantity)

    redirect_to products_path, notice: "Order placed successfully for #{quantity} #{@product.name}(s)!"
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end
end
