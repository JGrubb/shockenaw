class ChargesController < ApplicationController

  require 'securerandom'

  def create

    @product = Product.find_by sku: params[:sku]
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    shock_customer = Customer.create_with(stripe_id: customer.id)
                         .find_or_create_by(email: params[:stripeEmail])

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @product.price,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

    order = Order.create(customer: shock_customer)
    order.products << @product

    OrderMailer.order_email(shock_customer, order).deliver_now

    redirect_to show_order_path(uuid: order.uuid)

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to root_path
  end
end
