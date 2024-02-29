
require 'twilio-ruby'

class TwilioService
  def initialize
    @client = Twilio::REST::Client.new(Rails.application.credentials.twilio[:account_sid], Rails.application.credentials.twilio[:auth_token])
  end

  def send_whatsapp_message(to, body)
    @client.messages.create(
      from: "whatsapp:#{Rails.application.credentials.twilio[:whatsapp_number]}",
      to: "whatsapp:#{to}",
      body: body
    )
  end

end
