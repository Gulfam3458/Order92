class PhoneNumber < ApplicationRecord
  def generate_pin
    self.pin = rand(0000..9999).to_s.rjust(4, "0")
     save
  end
  def verify(entered_pin)
    update(verified: true) if self.pin == entered_pin
  end
  def twilio_client
    Twilio::REST::Client.new'ACed8f12be79ea82f9795b177cb02550d6', '05eaceec44da258acef0e321be92f613'
  end

  def send_pin
    puts 'ok'
    twilio_client.messages.create(
        to: self.phone_number,
        from: '(228) 641-0416',
        body: "Your PIN is #{pin}"
    )
  end

end
