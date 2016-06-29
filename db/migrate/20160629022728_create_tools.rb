class CreateTools < ActiveRecord::Migration
  def change
    create_table :tools do |t|
      t.float :length
      t.float :diameter
      t.integer :numFlutes
      t.string :material

      t.timestamps null: false
    end
  end
end
