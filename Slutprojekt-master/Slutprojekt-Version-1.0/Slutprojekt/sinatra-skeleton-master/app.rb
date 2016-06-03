
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
    @all_assignments = Assignment.all(id: session[:user_id])
    @categories = Category.all(user_id: session[:user_id])
    p @categories
    erb :create
  end

  post '/create/assignment' do
    if session[:user_id]
      day = Day.first(:date => Date.parse(params['date']))

      assignment = Assignment.create(name: params['name'],
                      description: params['description'],
                      time: params['time'],
                      category_id: params['category'],
                      day: day)


    assignment.users << @user
    assignment.save

    p assignment


  end
    redirect back
  end



  post '/create/category' do
    if session[:user_id]
      @category = Category.create(name: params['category_name'],
                                user_id: session[:user_id])
      end
    redirect back
  end

  get '/share/:assignment_id' do
    if session[:user_id]
      @assignment = Assignment.first(:id => params[:assignment_id])
      @categories = Category.all(user_id: session[:user_id])
      @all_assignments = @user.assignments
  end
    erb :share
  end

  post '/share/:assignment_id' do


    @assignment = Assignment.first(:id => params[:assignment_id])
    @target_user = User.first(email: params['email'])

    if AssignmentUser.first(:user_id => @target_user.id, :assignment_id => @assignment.id)

      # Redan delad med användaren
      redirect "#{back}#already_shared"
    else
      @assignment.users << @user
      @user.assignments << @assignment
      @user.save
      @assignment.save
      AssignmentUser.create(:user_id => @target_user.id, :assignment_id => @assignment.id)
      redirect "#{back}#shared"
    end



  end

  post '/assignment/:assignment_id/delete/' do
    @assignment = Assignment.first(:id => params[:assignment_id])

    if @assignment && session[:user_id]
      AssignmentUser.all(:assignment_id => @assignment.id).destroy
      @assignment.destroy
      redirect back
    else
      redirect back
    end
  end



  get '/home' do

    if session[:user_id] && @user
        day = Day.first(:date => Date.today)
        @assignment = Assignment.first(:id => params[:assignment_id])
        @assignments = @user.assignments.all(day: day)
        p @day_assignments
        p @day_assignments
        @all_assignments = @user.assignments
        p @all_assignments
        p @all_assignments
        @categories = Category.all(user_id: session[:user_id])
        @day = Day.first(:id => params[:day_id])




        

        erb :overview
    else
      redirect '/'
      end
  end



  get '/category/:category_id' do
    if session[:user_id] && @user
      @assignments = Assignment.all(category_id: params[:category_id])
      @all_assignments = @user.assignments
      @category = Category.first(:id => params[:category_id])
      @categories = Category.all(user_id: session[:user_id])

    erb :category

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
      redirect '/login'
    end
    end


  post '/user/register' do
    if params['password'] == params['confirm_password']
      user = User.create(f_name: params['f_name'],
                  l_name: params['l_name'],
                         email: params['email'],
                         password: params['password']
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