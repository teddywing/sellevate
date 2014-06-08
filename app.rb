require 'sinatra'
require 'sinatra/json'
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
    
    redirect_url = contextio.connect("#{request['REQUEST_URI']}auth-callback")
    
    redirect to(redirect_url)
  end
  
  get '/auth-callback' do
    erb :auth_callback
  end
  
  get '/initialise-labels' do
    contextio = FancyBear::ContextIO::Label.new('sellevate.hack@gmail.com')
    contextio.create_defaults
    
    redirect to('/')
  end
  
  get '/messages.json' do
    contextio = FancyBear::ContextIO::Message.new('sellevate.hack@gmail.com')
    json contextio.all
  end
  
  get '/messages/:id.json' do
    contextio = FancyBear::ContextIO::Message.new('sellevate.hack@gmail.com')
    json contextio.get(params[:id])
  end
end
