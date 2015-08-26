class AddInstructionsTable < ActiveRecord::Migration
  def change
    create_table :instructions do |t|
      t.column  :instruction, :string

      t.timestamps
    end
  end
end
