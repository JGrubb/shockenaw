class ChargesController < ApplicationController

  def create
    # Amount in cents
    @amount = 399

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

    order = Order.create(customer: shock_customer, total: @amount)
    order = order.reload

    redirect_to order_path(uuid: order.uuid)

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
