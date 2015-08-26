require('spec_helper')
require 'ingredient'

describe(Recipe) do
  it('return the name of the recipe') do
    recipe = Recipe.create({recipe: 'carrot recipe'})
    expect(recipe.recipe).to(eq('carrot recipe'))
  end
end

describe("associationtest") do
  it('tests an association') do
    test_recipe = Recipe.create({recipe: 'test_rec'})
    test_ingredient = Ingredient.create([ ingredient: 'apple', id: test_recipe.id ])
    test_recipe.ingredients.push(test_ingredient)
    expect(test_recipe.ingredients).to eq test_ingredient
  end
end


# describe("associationtest") do
#   it('tests an association') do
#     test_recipe = Recipe.create({recipe: 'test_rec'})
#     test_ingredient = Ingredient.create([ ingredient: 'apple', id: test_recipe.id ])
#     test_recipe.ingredients.push(test_ingredient)
#     expect(test_recipe.ingredients.first.ingredient).to eq "apple"
#   end
# end

##the above is a way to extract a single string ('apple' in this case).
