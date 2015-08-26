class CreateRecipeTable < ActiveRecord::Migration
  def change
    create_table(:ingredients) do |t|
      t.column(:ingredient, :string)


      t.timestamps()
    end
  end
end
