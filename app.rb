require 'sinatra'
require './fancy_bear/fancy_bear'

class App < Sinatra::Base
  configure :production, :development do
    enable :logging
  end

  get '/' do
    erb :index
  end

  get '/sign-up' do
    erb :sign_up
  end

  post '/sign-up' do
    #
  end
  
  get '/auth-begin' do
    contextio = FancyBear::ContextIO::Auth.new
    
    redirect_url = contextio.connect("#{request['REQUEST_URI']}/auth-callback")
    
    redirect to(redirect_url)
  end
  
  get '/auth-callback' do
    erb :auth_callback
  end
end
