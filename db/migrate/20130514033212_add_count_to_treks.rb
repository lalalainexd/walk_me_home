class AddCountToTreks < ActiveRecord::Migration
  def change
    add_column :treks, :count, :integer, default: 0
  end
end
