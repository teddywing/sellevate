require './contextio'

module Sellevate
end

contextio = Sellevate::ContextIO::Auth.new
puts contextio.authenticate('sellevate.hack@gmail.com')
