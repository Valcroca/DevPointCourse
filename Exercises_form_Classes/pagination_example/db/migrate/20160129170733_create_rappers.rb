class CreateRappers < ActiveRecord::Migration
  def change
    create_table :rappers do |t|
      t.string :name
      t.boolean :og, default: false
      t.integer :number_of_teard_drops, default: 0
      t.boolean :auto_tune, default: false
      t.integer :number_of_guns, default: 0
      t.string :race
      t.boolean :dead, default: false

      t.timestamps null: false
    end
  end
end
