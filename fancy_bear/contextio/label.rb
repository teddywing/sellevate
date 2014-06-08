require 'contextio'

module FancyBear
  module ContextIO
    
    class Label < Base
      def initialize(email)
        super()
        
        @account = @contextio.accounts.where(:email => email).first
        @labels = []
        @defaults = ['[FancyBear]/Low', '[FancyBear]/Medium', '[FancyBear]/High']
      end
      
      def all
        return if not @labels.empty?
        
        @account.sources.first.folders.each do |f|
          @labels << f.name
        end
        @labels
      end
      
      def create_defaults
        all()
        @labels.each do |l|
          return if @defaults.include?(l)
        end
        
        @defaults.each do |l|
          system "contextio-put-folder.py '#{@account.id}' '#{l}'"
        end
      end
    end
    
  end
end
