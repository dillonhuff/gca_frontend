class CreateVices < ActiveRecord::Migration
  def change
    create_table :vices do |t|
      t.float :xPos
      t.float :yPos
      t.float :zPos
      t.float :xLength
      t.float :yLength
      t.float :baseHeight
      t.float :topHeight
      t.float :clampWidth
      t.float :maxJawWidth
      t.float :protectiveBasePlateHeight

      t.timestamps null: false
    end
  end
end
