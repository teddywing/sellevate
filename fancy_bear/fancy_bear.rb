require './contextio'

module FancyBear
end

contextio = FancyBear::ContextIO::Auth.new
puts contextio.authenticate('sellevate.hack@gmail.com')
