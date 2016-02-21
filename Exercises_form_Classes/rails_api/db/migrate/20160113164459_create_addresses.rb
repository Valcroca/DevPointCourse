class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :city
      t.string :state
      t.string :zip
      t.string :street
      t.belongs_to :library

      t.timestamps null: false
    end
  end
end
