class CreateStaffMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :staff_members do |t|
      t.integer :location_id
      t.string :name
      t.string :position, default: "Staff Member"
      t.boolean :active, default: true
    end

    add_index :staff_members, :location_id
  end
end
