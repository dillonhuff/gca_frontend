class CreateBasePlates < ActiveRecord::Migration
  def change
    create_table :base_plates do |t|
      t.float :height

      t.timestamps null: false
    end
  end
end
