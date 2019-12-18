class VideogameSystemsController < ApplicationController

  get '/systems' do
    # redirect_if_not_logged_in
    @systems = VideogameSystem.all
    erb :'systems/index'
  end

  get '/systems/new' do
    erb :'systems/new'
  end

  post '/systems/new' do
    @system = VideogameSystem.create(:name => params[:name],
      :release_date => params[:release_date],
      :manufacturer => params[:manufacturer])
    redirect to "/systems/#{@system.id}"
  end

  get '/systems/:id' do
    # redirect_if_not_logged_in
    @system = VideogameSystem.find_by_id(params[:id])
    erb :'systems/show'
  end

  get '/systems/:id/edit' do
    @system = VideogameSystem.find_by_id(params[:id])
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

  delete '/systems/:id' do
    system = VideogameSystem.find_by_id(params[:id])
    system.delete
    redirect to '/systems'
  end
end
