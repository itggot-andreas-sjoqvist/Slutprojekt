
class App < Sinatra::Base
  enable :sessions

  before do
       @user = User.get(session[:user_id])
     end

  get '/' do
    if session[:user_id]
        redirect '/home'
    else
      redirect '/login'
      end
  end

  get '/create' do
    @projects = Project.all(user_id: @user.id)
    @categories = Category.all(user_id: @user_id)
    erb :create
  end

  post '/create/assignment' do
    @assignment = Assignment.create(name: params['name'],
                      description: params['description'],
                      date: params['date'],
                      time: params['time'],
                      project_id: params['project'],
                      category_id: params['category'],
                      user_id: session[:user_id]
    )
    redirect back
  end

  post '/create/project' do
    @project = Project.create(name: params['name'],
                             start_date: params['start_date'],
                             end_date: params['end_date'],
                             description: params['description'],
                             category_id: params['category'],
                             user_id: session[:user_id])
    redirect back
  end

  post '/create/category' do
   @category = Category.create(name: params['category_name'],
                                user_id: session[:user_id])
    redirect back
  end


  post '/create/dag, typ' do
    day = Day.create(date: Date.new(params['date']))
    day.assignments << params['rubrik']
  end

  get '/home' do

    if session[:user_id]
        @users = User.all(:id => session[:user_id])
        @assignments = Assignment.all(user_id: @user.id)
        @projects = Project.all(user_id: @user.id)
        @categories = Category.all(user_id: @user.id)
        @days = Day.all

        erb :overview
    else
      redirect '/'
      end
  end

  get '/project/' do

        @projects = Project.all(user_id: @user.id)
        @categories = Category.all(user_id: @user.id)
        erb :project

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