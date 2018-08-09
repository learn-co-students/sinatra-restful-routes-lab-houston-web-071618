require "./config/environment"

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, "public"
    set :views, "app/views"
  end

  get "/" do
    erb :index
  end

  get "/recipes" do #loads the index page
    @recipes = Recipe.all
    erb :index
  end

  get "/recipes/new" do #loads a new form to create a new recipe.
    erb :new
  end

  post "/recipes" do #creates a recipe
    @recipe = Recipe.create(params)
    redirect "/recipes/#{@recipe.id}"
  end

  get "/recipes/:id" do #loads show page
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  get "/recipes/:id/edit" do #loads edit form
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  patch "/recipes/:id" do
    @recipe = Recipe.find(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect "/recipes/#{@recipe.id}"
  end

  delete "/recipes/:id/delete" do #delete action
    @recipe = Recipe.find(params[:id])
    @recipe.delete
    redirect "/recipes"
  end
end
