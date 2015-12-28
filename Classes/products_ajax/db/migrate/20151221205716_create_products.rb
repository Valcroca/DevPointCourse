class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.float :base_price
      t.text :description
      t.integer :quantity_on_hand
      t.string :color
      t.float :weight
      t.text :other_attributes

      t.timestamps null: false
    end
  end
end
