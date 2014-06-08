require 'contextio'

module FancyBear
  module ContextIO
    
    class Message < Base
      def initialize(email)
        super()
        
        @account = @contextio.accounts.where(:email => email).first
      end
      
      def all
        messages = []
        @account.messages.each do |m|
          messages << {
            :id => m.message_id,
            :from_address => m.from['email'],
            :from_name => m.from['name'],
            :subject => m.subject,
            :timestamp => m.date,
            :labels => m.folders
          }
        end
        messages
      end
      
      def get
        
      end
    end
    
  end
end
