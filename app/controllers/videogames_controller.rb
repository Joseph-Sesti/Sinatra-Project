class VideogamesController < ApplicationController

  get '/videogames' do
    redirect_if_not_logged_in
    @videogames = Videogames.all
    erb :'videogames/index'
  end

  post '/videogames' do
    
  end

  get '/videogames/new' do
    erb :'videogames/new'
  end

  post '/videogames/new' do
    @videogame = Videogame.create(:title => params[:title], :system => params[:system], :publisher => params[:publisher], :release_date => params[:release_date])
  end
end
