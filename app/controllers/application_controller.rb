class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect '/recipes'
  end

  get '/recipes' do
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    # binding.pry
    @recipe = Recipe.create(params)
    # binding.pry
    # params[:id] = @recipe.id
    redirect "/recipes/#{@recipe.id}"
  end

  get '/recipes/:id' do
    # binding.pry
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.update(params)
    redirect to '/recipes/#{@recipe.id}'
  end

  delete '/recipes/:id' do
    Recipe.find(params[:id]).destroy

    redirect '/recipes'
  end

end
