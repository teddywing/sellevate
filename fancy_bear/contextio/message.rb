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
      
      def get(id)
        output = {}
        message = @account.messages.where(:message_id => id).first
        
        output['from_address'] = message.from['email']
        output['from_name'] = message.from['name']
        output['subject'] = message.subject
        output['timestamp'] = message.date
        output['labels'] = message.folders
        
        message.body_parts.each do |p|
          if p.content
            output['html'] = p.html?
            output['content'] = p.content
          end
        end
        output
      end
    end
    
  end
end
