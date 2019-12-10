class VideogameSystemsController < ApplicationController

  get '/systems' do
    redirect_if_not_logged_in
    @systems = System.all
    erb :systems/index
  end

  get 'systems/new' do
    redirect_if_not_logged_in
    erb :systems/new
  end
end
