class App < Sinatra::Base
  enable :sessions

   before do
     @user = User.get(session[:user])
  end

  get '/' do
    if session[:user_id]
      erb :overview
    else
      redirect '/login'
    end
    end

  get '/login' do
    erb :login, layout: false
  end

  get '/userrights' do
    if session[:user_id]
      erb :overview
    else
      redirect '/login'
    end
  end

  post '/user/login' do
    user = User.first(email: params['email'])
    if user && user.password == params['password']
      session[:user_id] = user.id
      redirect '/userrights'
    end
  end

  post '/user/register' do
    if params['password'] == params['confirm-password']
      User.create(f_name: params['f_name'],
                  l_name: params['l_name'],
                         email: params['email'],
                         password: params['password']
                          )
      redirect '/userrights'
    end
  end

  post '/user/logout' do
    session[:user_id] = nil
    redirect '/'
  end



end