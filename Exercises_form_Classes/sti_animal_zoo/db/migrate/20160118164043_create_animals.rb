class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.string :name
      t.integer :age
      t.string :race
      t.belongs_to :zoo

      t.timestamps null: false
    end
  end
end
