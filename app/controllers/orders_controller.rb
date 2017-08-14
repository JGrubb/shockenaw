class OrdersController < ApplicationController

  def new
    @product = Product.find_by sku: params[:sku]
  end

  def show
    @order = Order.find_by(uuid: params[:uuid])
  end

  def create
    @order = Order.create
    @line_item = LineItem.create({
                                  product: Product.find_by(uuid: params[:uuid])
                              })

  end
end
