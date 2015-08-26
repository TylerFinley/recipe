require 'bundler/setup'
Bundler.require(:default)
require 'pry'

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file}

get '/' do
  erb :index
end

get '/ingredients' do
  @ingredient = Ingredient.all()
  erb :ingredient_list
end

post '/ingredient/new' do
  newingred = params.fetch('ingredient')

  Ingredient.create(ingredient: newingred)
  @ingredients = Ingredient.all
  redirect "/ingredients"
end

get '/ingredient/:id' do
  @ingredient = Ingredient.find(params['id'])

  erb :ingredient_edit
end

patch '/ingredient/:iid' do
  iid = params.fetch('iid')
  @ingredient = Ingredient.find(iid)

  @ingredient.update({ingredient: params['new_ingredient']})
  redirect "ingredients"
end

delete '/ingredient/:iid' do
  iid = params.fetch('iid')
  @ingredient = Ingredient.find(iid)

  @ingredient.destroy
  redirect "/ingredients"
end
#################RECIPE##########
get '/recipes' do
  @recipes = Recipe.all()
  erb :recipe_list
end

post '/recipe/new' do
  @recipe = Recipe.create(recipe: params['recipe'])
  redirect '/recipes'
end

get '/recipe/:id' do
  @recipe = Recipe.find(params['id'])
  # @ingredients = Ingredient.all()

  erb :recipe_edit
end

patch '/recipe/:rid' do
  rid = params.fetch("rid")
  @recipe = Recipe.find(rid)

  @recipe.update({recipe: params["new_recipe"]})
  redirect "recipes"
end

delete '/recipe/:rid' do
  rid = params.fetch('rid')
  @recipe = Recipe.find(rid)
  @recipe.destroy
  redirect '/recipes'
end

#! use this as a refrence for later. I'll explain on each line (as best I can)

post '/recipe/:rid/ingredient/new' do
  new_ingred = params.fetch('ingredient') #fetch 'ingredient' from the Add Ingredient input form at recipe_edit.erb
  rid = params.fetch('rid') # self explanitory. Fetch the id from the url path and save it to rid
  recipe = Recipe.find(rid) # find the recipe by the rid variable
  new_ingredient = Ingredient.new(ingredient: new_ingred) #create a new ingredient object and insert the ingredient from what we fetched as the input (new_ingred)
  new_ingredient.save #...save it..
  recipe.ingredients.push(new_ingredient) # push the new_ingredient OBJECT into the found recipie from line 63 with the method -> recipe.ingredients...
  redirect "/recipe/#{rid}"
end
