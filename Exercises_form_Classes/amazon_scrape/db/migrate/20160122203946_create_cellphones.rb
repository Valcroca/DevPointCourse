class CreateCellphones < ActiveRecord::Migration
  def change
    create_table :cellphones do |t|
      t.string :name
      t.string :price
      t.string :stars
      t.string :img_src

      t.timestamps null: false
    end
  end
end
