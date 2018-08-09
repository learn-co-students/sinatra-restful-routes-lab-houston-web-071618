class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # get '/' do
  #   erb :index
  # end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end

# read a single recipe
  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])

    erb :show
  end

# display form to edit
  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

# create a new recipe and save to db
  post '/recipes' do
    @recipe = Recipe.create(params)

    redirect "/recipes/#{@recipe.id}"
  end

#form to edit a single recipe
  patch '/recipes/:id' do
    recipe = Recipe.find(params[:id])
    recipe.update(params[:recipe])

    redirect "/recipes/#{params[:id]}"
  end

  delete '/recipes/:id/delete' do
    recipe = Recipe.find(params[:id])
    recipe.delete
    # Recipe.destroy(params[:id])

    redirect 'index'
  end

end
