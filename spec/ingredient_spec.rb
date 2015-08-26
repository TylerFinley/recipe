require('spec_helper')

describe(Ingredient) do
    it('return the name of the ingredient') do
      ingredient = Ingredient.create({ingredient: 'carrot'})
      expect(ingredient.ingredient).to(eq('carrot'))


  end
end
