class AddNameToTripAndRemoveExpectedEndAtFromTrip < ActiveRecord::Migration
  def change
    add_column :trips, :name, :string
    remove_column :trips, :expected_end_at
  end
end
