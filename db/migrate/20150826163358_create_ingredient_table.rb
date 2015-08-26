class CreateIngredientTable < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.column :recipe, :string

      t.timestamps
    end
  end
end
