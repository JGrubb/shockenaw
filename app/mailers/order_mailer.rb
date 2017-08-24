class OrderMailer < ApplicationMailer

  def order_email(user, order)
    @user = user
    @order = order
    mail(to: @user.email, subject: "Shockenaw order ##{@order.uuid}")
  end

end
