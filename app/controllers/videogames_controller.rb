class VideogamesController < ApplicationController

  get '/videogames' do
    # redirect_if_not_logged_in
    @videogames = Videogame.all
    erb :'videogames/index'
  end

  get '/videogames/new' do
    erb :'videogames/new'
  end

  post '/videogames/new' do
    @videogame = Videogame.create(:title => params[:title],
      :videogame_system => params[:videogame_system],
      :publisher => params[:publisher],
      :release_date => params[:release_date])
    redirect to "/videogames/#{@videogame.id}"
  end

  get '/videogames/:id' do
    @videogame = Videogame.find_by_id(params[:id])
    erb :'videogames/show'
  end

  get '/videogames/:id/edit' do
    @videogame = Videogame.find_by_id(params[:id])
    erb :'videogames/edit'
  end

  patch '/videogames/:id' do
    @videogame = Videogame.find_by_id(params[:id])
    @videogame.title = params[:title]
    @videogame.videogame_system = params[:videogame_system]
    @videogame.publisher = params[:publisher]
    @videogame.release_date = params[:release_date]
    @videogame.save
    redirect to "/videogames/#{@videogame.id}"
  end

end
