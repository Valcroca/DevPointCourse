class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :list_id
      t.text :name
      t.string :description
      t.boolean :status

      t.timestamps null: false
    end
  end
end
