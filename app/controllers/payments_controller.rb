class PaymentsController < ApplicationController
  def create
    @appointment=Appointment.find(params[:appointment_id])
    @session=Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      mode: 'payment',
      line_items: [{
        price_data: {
          currency: 'gbp',
          product_data: {
            name: "Appointment Deposit"
          },
          unit_amount: 30
        },
        quantity: 1
      }],
      success_url: success_appointment_payments_url(@appointment),
      cancel_url: cancel_appointment_payments_url(@appointment)
    )
    @appointment.update(stripe_session_id: @session.id)
    redirect_to @session.url, allow_other_host: true
  end

  

end
