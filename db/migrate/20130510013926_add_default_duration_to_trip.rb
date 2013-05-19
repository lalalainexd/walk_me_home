class AddDefaultDurationToTrip < ActiveRecord::Migration
  def change
    add_column :trips, :default_duration, :integer
  end
end
