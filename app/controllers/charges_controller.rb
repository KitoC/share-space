class ChargesController < ApplicationController
  before_action :set_item

  def create
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer => customer.id,
      amount: (@item.total_cost*100).to_i,
      :description => 'Rails Stripe Customer',
      :currency => 'aud'
    )
    set_paid_status(@item)
    UserNotifierMailer.send_transaction_record(current_user).deliver
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to @item
  end

  private
  def set_paid_status(booking)
    booking.update(paid: true)
  end
  def set_item
    @item = Booking.find(params[:booking_id])
  end
end
