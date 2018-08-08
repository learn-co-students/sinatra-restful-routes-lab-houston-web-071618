class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes/new' do
    erb :new
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  post '/recipes/:id' do
    #binding.pry
    recipe = Recipe.find(params[:id])
    recipe.update(params[:name])
    # recipe.ingredients = params[:ingredients]
    # recipe.cook_time = params[:cook_time]
    # recipe.save
    # binding.pry
    redirect "/recipes/#{params[:id]}"
  end

  post '/recipes' do
    Recipe.create(params)
    redirect "/recipes/#{Recipe.last.id}"
  end

  post '/recipes/:id/delete' do
    #binding.pry
    recipe = Recipe.find_by_id(params[:id])
    recipe.destroy
    redirect '/recipes'
  end







end
