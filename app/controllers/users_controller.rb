class UserController < ApplicationController
  get '/users/:id' do
    if !logged_in?
      redirect '/systems'
    end

    @user = User.find(params[:id])
    if !@user.nil? && @user == current_user
      erb :users/show
    else
      redirect '/systems'
    end
  end

  get '/login' do
    @error_message = params[:error]
    if !session[:user_id]
      erb :'users/login'
    else
      redirect '/account'
    end
  end

  post '/login' do
    @user = User.find_by(:username => params[:username])
    binding.pry
    if @user && @user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/account'
    else
      redirect '/signup'
    end
  end

  get '/logout' do
    if session[:user_id] != nil
      session.destroy
      redirect to '/login'
    else
      redirect to '/'
    end
  end
end
