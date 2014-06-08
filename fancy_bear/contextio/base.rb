require 'contextio'

module FancyBear
  module ContextIO
    
    class Base
      def initialize
        @contextio = ::ContextIO.new(API_KEY, API_SECRET)
      end
    end
    
  end
end
