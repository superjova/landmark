class AddLocationCategoryIdToLocations < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :location_category_id, :integer
  end
end
