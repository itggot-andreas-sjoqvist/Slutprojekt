
class App < Sinatra::Base
  enable :sessions

  before do
       @user = User.get(session[:user])
     end

  get '/' do
    if session[:user_id]
        redirect '/home'
    else
      redirect '/login'
      end
  end

  get '/home' do
    @users = User.all
    if session[:user_id]
        @assignments = Assignment.all(user_id: @user_id)
        @projects = Project.all(user_id: @user_id)
        erb :overview
    else
      redirect '/'
      end
  end

  get '/login' do
    erb :login, layout: false
  end


  post '/user/login' do
    user = User.first(email: params['email'])
    if user && user.password == params['password']
      session[:user_id] = user.id
      redirect '/home'
    else
      redirect back
    end
    end


  post '/user/register' do
    if params['password'] == params['confirm_password']
      User.create(f_name: params['f_name'],
                  l_name: params['l_name'],
                         email: params['email'],
                         password: params['password'],
                          role_id: 1
                          )
      redirect '/home'
    end
      redirect back
  end

  get '/user/logout' do
    session[:user_id] = nil
    redirect '/'
  end



end