class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.string :name
      t.string :color
    end

    create_table :location_tags do |t|
      t.integer :location_id
      t.integer :tag_id
      t.timestamps
    end

    add_index :location_tags, [:location_id, :tag_id]
    add_index :location_tags, :tag_id
  end
end
