class VideogameSystemsController < ApplicationController

  get '/systems' do
    # redirect_if_not_logged_in
    @videogame_system = System.all
    erb :'systems/index'
  end

  post '/system' do

  end

  get '/systems/new' do
    erb :'systems/new'
  end

  post '/systems/new' do
    @system = VideogameSystem.create(:name => params[:name],
      :release_date => params[:release_date],
      :manufacturer => params[:manufacturer])
    redirect to "/systems/show"
  end

  get 'system/:id' do
    # redirect_if_not_logged_in
    @system = VideogameSystem.find(params[:id])
    erb :'system/show'
  end

  get '/systems/:id/edit' do
    @systems = VideogameSystem.find_by_id(params[:id])
    erb :'systems/edit'
  end

  patch '/systems/:id' do
    @system = VideogameSystem.find_by_id(params[:id])
    @system.name = params[:name]
    @system.release_date = params[:release_date]
    @system.manufacturer = params[:manufacturer]
    @system.save
    redirect to "/systems/#{@system.id}"
  end
end
