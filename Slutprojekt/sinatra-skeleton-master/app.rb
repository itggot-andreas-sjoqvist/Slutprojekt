class App < Sinatra::Base
  enable :sessions

  get '/' do
    @assignments = Assignment.all
    @projects = Project.all
    @users = User.all
    erb :layout
  end

  get '/login' do
    @users = User.all
    erb :syrgr
  end


end