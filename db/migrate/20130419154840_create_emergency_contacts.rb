class CreateEmergencyContacts < ActiveRecord::Migration
  def change
    create_table :emergency_contacts do |t|
      t.references :user
      t.integer :phone_number

      t.timestamps
    end
    add_index :emergency_contacts, :user_id
  end
end
