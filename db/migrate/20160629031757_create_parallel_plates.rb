class CreateParallelPlates < ActiveRecord::Migration
  def change
    create_table :parallel_plates do |t|
      t.float :height

      t.timestamps null: false
    end
  end
end
