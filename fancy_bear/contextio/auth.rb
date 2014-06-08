require 'contextio'

module FancyBear
  module ContextIO
    
    class Auth
      def initialize
        @contextio = ::ContextIO.new(API_KEY, API_SECRET)
      end
      
      def connect(callback_url)
        connection_token = @contextio.connect_tokens.create(callback_url)
        connection_token.browser_redirect_url
      end
    end
    
  end
end
