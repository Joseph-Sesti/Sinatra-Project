class VideogameSystemsController < ApplicationController

  get '/systems' do
    redirect_if_not_logged_in
    @system = System.all
    erb :system/index
  end

  # post '/system' do
  #   redirect_if_not_logged_in
  #   unless
  # end

  get 'system/new' do
    redirect_if_not_logged_in
    erb :system/new
  end

  post 'system/new'do

  end

  get 'system/id' do
    redirect_if_not_logged_in
    @system = System.find(params[:id])
    erb :system/show
  end
end
