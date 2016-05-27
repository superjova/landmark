class CreateLandmarks < ActiveRecord::Migration[5.0]
  def change
    create_table :landmarks do |t|
      t.string :name
      t.string :address
      t.float :latitude
      t.float :longitude
    end
  end
end
