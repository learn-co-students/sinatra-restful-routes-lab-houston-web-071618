class RecipesController < ApplicationController

  set :method_override, true
  
  # GET: /recipes
  get "/recipes" do
    @recipes = Recipe.all

    erb :"/recipes/index"
  end

  # GET: /recipes/new
  get "/recipes/new" do
    erb :"/recipes/new"
  end

  # POST: /recipes
  post "/recipes" do
    @recipe = Recipe.create(params)
    # binding.pry
    redirect "/recipes/#{@recipe.id}"
  end

  # GET: /recipes/5
  get "/recipes/:id" do
    @recipe = Recipe.find_by_id(params[:id])
    erb :"recipes/show"
  end

  # GET: /recipes/5/edit
  get "/recipes/:id/edit" do
    @recipe = Recipe.find_by_id(params[:id])

    erb :"/recipes/edit"
  end

  # PATCH: /recipes/5
  patch "/recipes/:id" do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.update

    redirect "/recipes/#{params[:id]}"
  end

  # DELETE: /recipes/5/delete
  delete '/recipes/:id/delete' do #delete action
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect to '/recipes'
  end
end
