require 'contextio'

module FancyBear
  module ContextIO
    
    class Auth
      def initialize
        @contextio = ::ContextIO.new(API_KEY, API_SECRET)
      end
      
      def authenticate(email)
        connection_token = @contextio.connect_tokens.create('http://google.com')
        connect_tokens.browser_redirect_url
      end
    end
    
  end
end
