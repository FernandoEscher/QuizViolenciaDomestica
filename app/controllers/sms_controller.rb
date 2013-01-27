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
        twilio_sid = "AC3e87c7e425bbbce3767e2c389cc6ffd0"
        twilio_token = "e999ba3bef1d21c6d2255ea93640e89e"
        twilio_phone_number = "5104233935"

        message_body = params["Body"]
        from_number = params["From"]
        country = params["FromCountry"]
        
       
        
        # buscar si este numero esta en las respuestas
        # si esta, enviar pregunta siguiente
        # si no, enviar pregunta 1
        # si es ultima pregunta hacer la evaluacion
        
        
        quiz = Quiz.first
        r=Response.where(:phone=>from_number).count  
        
        q=quiz.questions[r]
        if ["SI", "NO", "S", "N"].include?(message_body.upcase)
          Response.create(:phone=>from_number, :answer=>message_body.upcase, :question_id=>q.id)
        end
        
        r=Response.where(:phone=>from_number).count  
        if r == quiz.questions.count
          @question_to_send = "Por favor comunicate al numero 114 o al 2237-6830 para recibir ayuda profesional."
        else
          @question_to_send=q.description
        end
        
        
        
        # @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token
        # @twilio_client.account.sms.messages.create(
        #   :from => "+1#{twilio_phone_number}",
        #   :to => from_number,
        #   :body => question_to_send
        # )
          
      end
end
