require 'bundler/setup'
Bundler.require(:default)
require 'pry'

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file}

###INDEX###

get '/' do
  erb :index
end

###INGREDIENT###

get '/ingredients' do
  @ingredient = Ingredient.all()
  erb(:ingredient_list)
end

get '/ingredient/:iid' do
  id = params.fetch('iid')
  @ingredient = Ingredient.find(id)
  erb :ingredient_edit
end

patch '/ingredient/:iid' do
  new_ingredient = params.fetch('new_ingredient')
  id = params.fetch('iid')
  ingredient = Ingredient.find(id)
  ingredient.update({ingredient: new_ingredient})
  redirect "/ingredients"
end

delete '/ingredient/:iid' do
  iid = params.fetch('iid')
  ingredient = Ingredient.find(iid)
  ingredient.destroy
  redirect '/ingredients'
end

post '/ingredient/new' do
  new_ingredient = params.fetch('ingredient')
  Ingredient.create(ingredient: new_ingredient)
  redirect '/ingredients'
end

###RECIPES###

get '/recipes' do
  @recipes = Recipe.all()
  erb(:recipe_list)

end

get '/recipe/:rid' do
  rid = params.fetch('rid')
  @recipe = Recipe.find(rid)
  @ingredients = Ingredient.all
  erb(:recipe_edit)
end

patch '/recipe/:rid' do
  rid = params.fetch('rid')
  new_recipe = params.fetch("new_recipe")
  recipe = Recipe.find(rid)
  recipe.update({:recipe => new_recipe})
  redirect "/recipes"
end
post '/recipe/new' do
  @recipe = Recipe.create(recipe: params['recipe'])
  redirect "/recipes"
end

delete '/recipe/:rid' do
  rid = params.fetch('rid')
  @recipe = Recipe.find(rid)
  @recipe.destroy()
  redirect "/recipes"
end

###ADD INGREDS TO RECIPES###

# post '/recipe/:rid/ingredient/new' do
#   ingred = options_from_collection_for_select(@ingredients, 'id', 'ingredient')
#   rid = params.fetch('rid')
#   fetched_ingredient = Ingredient.find_by(ingredient: "ingred")
#   recipe = Recipe.find(rid)
#   new_ingredient = Ingredient.new(ingredient: fetched_ingredient)
#   new_ingredient.save
#   recipe.ingredients.push(new_ingredient)
#   redirect "/recipe/#{rid}"
# end

post '/recipe/:rid/ingredient/new' do
# binding.pry
  rid = params.fetch('rid')
  fetched_ingredient = Ingredient.find(params['ingredient'].to_i)
  recipe = Recipe.find(rid)
  # new_ingredient = Ingredient.new(ingredient: fetched_ingredient)
  # new_ingredient.save
binding.pry
  recipe.ingredients.push(fetched_ingredient)
  redirect "/recipe/#{rid}"
end











# get '/ingredients' do
#   @ingredient = Ingredient.all()
#   erb :ingredient_list
# end
#
# post '/ingredient/new' do
#   recipe = params.fetch('')
#   newingred = params.fetch('ingredient')
#   Ingredient.create(ingredient: newingred)
#   @ingredients = Ingredient.all
#   @recipe = Recipe.find_by(recipe:)
#   redirect "/ingredients"
# end
#
# get '/ingredient/:id' do
#   @ingredient = Ingredient.find(params['id'])
#   @recipes = Recipe.all()
#
#   erb :ingredient_edit
# end
#
# patch '/ingredient/:iid' do
#   iid = params.fetch('iid')
#   @ingredient = Ingredient.find(iid)
#
#   @ingredient.update({ingredient: params['new_ingredient']})
#   redirect "ingredients"
# end
#
# delete '/ingredient/:iid' do
#   iid = params.fetch('iid')
#   @ingredient = Ingredient.find(iid)
#
#   @ingredient.destroy
#   redirect "/ingredients"
# end
# #################RECIPE##########
# get '/recipes' do
#   @recipes = Recipe.all()
#   erb :recipe_list
# end
#
# post '/recipe/new' do
#   @recipe = Recipe.create(recipe: params['recipe'])
#   redirect '/recipes'
# end
#
# get '/recipe/:id' do
#   @recipe = Recipe.find(params['id'])
#   @ingredients = Ingredient.all()
#
#   erb :recipe_edit
# end
#
# patch '/recipe/:rid' do
#   rid = params.fetch("rid")
#   @recipe = Recipe.find(rid)
#
#   @recipe.update({recipe: params["new_recipe"]})
#   redirect "recipes"
# end
#
# delete '/recipe/:rid' do
#   rid = params.fetch('rid')
#   @recipe = Recipe.find(rid)
#   @recipe.destroy
#   redirect '/recipes'
# end
#
# #! use this as a refrence for later. I'll explain on each line (as best I can)
#
# post '/recipe/:rid/ingredient/new' do
#   new_ingred = params.fetch('ingredient')                                                         #fetch 'ingredient' from the Add Ingredient input form at recipe_edit.erb
#   rid = params.fetch('rid')                                                                       # self explanitory. Fetch the id from the url path and save it to rid
#   recipe = Recipe.find(rid)                                                                       # find the recipe by the rid variable
#   new_ingredient = Ingredient.new(ingredient: new_ingred)                                         #create a new ingredient object and insert the ingredient from what we fetched as the input (new_ingred)
#   new_ingredient.save                                                                             #...save it..
#   recipe.ingredients.push(new_ingredient)                                                         # push the new_ingredient OBJECT into the found recipie from line 63 with the method -> recipe.ingredients...
#   redirect "/recipe/#{rid}"
# end
