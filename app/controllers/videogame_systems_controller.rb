class VideogameSystemsController < ApplicationController

  get '/systems' do
    redirect_if_not_logged_in
    @system = System.all
    erb :'systems/index'
  end

  # post '/system' do
  #   redirect_if_not_logged_in
  #   unless
  # end

  get '/systems/new' do
    erb :'systems/new'
  end

  post 'system/new'do

  end

  get 'system/id' do
    redirect_if_not_logged_in
    @system = System.find(params[:id])
    erb :'system/show'
  end
end
