class SmsController < ApplicationController
  def send_text_message
      #(510) 423-3935
    
      number_to_send_to = params[:number_to_send_to]

      twilio_sid = "AC3e87c7e425bbbce3767e2c389cc6ffd0"
      twilio_token = "e999ba3bef1d21c6d2255ea93640e89e"
      twilio_phone_number = "5104233935"

      @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token

      @twilio_client.account.sms.messages.create(
        :from => "+1#{twilio_phone_number}",
        :to => number_to_send_to,
        :body => "This is an message. It gets sent to #{number_to_send_to}"
      )
    end
    
    
    def receive_sms 
        # let's pretend that we've mapped this action to 
        # http://localhost:3000/sms in the routes.rb file

        message_body = params["Body"]
        from_number = params["From"]

        SMSLogger.log_text_message from_number, message_body
      end
end
