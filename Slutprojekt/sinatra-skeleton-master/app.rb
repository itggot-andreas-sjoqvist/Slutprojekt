class App < Sinatra::Base
  enable :sessions

  get '/' do


    erb :layout

  end


end