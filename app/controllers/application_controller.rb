class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get '/' do
    @recipes = Recipe.all 
    
    erb :index
  end
  
  get '/recipes/new' do
    erb :new
  end
  
  get '/recipes' do
    redirect '/'
  end
  
  post '/recipes' do
    Recipe.create(params)
    
    redirect '/recipes'
  end
  
  def recipe
    if params[:id] != nil
      recipe = Recipe.find(params[:id])
    else
      recipe = Recipe.first
    end
    recipe
  end
  
  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    
    erb :show
  end
  
  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    
    erb :edit
  end
  
  patch '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    
    @recipe.update(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    
    redirect "/recipes/#{@recipe[:id]}" 
  end
  
  delete "/recipes/#{@recipe[:id]/delete}" do
    Recipe.find(params[:id]).destroy
  end
  
end