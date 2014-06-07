require 'sinatra'

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
end
