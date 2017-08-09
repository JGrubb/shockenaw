class OrdersController < ApplicationController
  def show
    @order = Order.find_by(uuid: params[:uuid])
  end
end
