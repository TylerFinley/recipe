class Recipe < ActiveRecord::Base
  has_and_belongs_to_many(:ingredients)
  validates(:recipe, {presence: true})
  validates(:instruction, length: { maximum: 500 }) #limit 500 characters

private

end
