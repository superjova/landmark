class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :type
      t.string :name
      t.string :address
      t.string :phone_number
      t.text :hours
      t.text :notes
    end
  end
end
