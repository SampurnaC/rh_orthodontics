class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def stripe
    payload = request.body.read
    sig_header = request.env['HTTP_STRIPE_SIGNATURE']
    endpoint_secret = ENV['STRIPE_WEBHOOK_SECRET']

    event = Stripe::Webhook.construct_event(
      payload, sig_header, endpoint_secret
    )

    if event.type == 'checkout.session.completed'
      session = event.data.object

      appointment = Appointment.find_by(stripe_session_id: session.id)
      appointment.update(payment_status: "paid") if appointment
    end

    head :ok
  rescue JSON::ParserError, Stripe::SignatureVerificationError
    head :bad_request
  end
end
