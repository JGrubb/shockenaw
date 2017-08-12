class ChargesController < ApplicationController

  require 'securerandom'

  def create
    products = {
        'mp3' => 399,
        'flac' => 599
    }
    # Amount in cents
    @amount = products[params[:name]]

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    shock_customer = Customer.create_with(stripe_id: customer.id)
                         .find_or_create_by(email: params[:stripeEmail])

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

    order = Order.create(customer: shock_customer, total: @amount, uuid: SecureRandom.uuid)

    redirect_to order_path(uuid: order.uuid)

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to root_path
  end
end
