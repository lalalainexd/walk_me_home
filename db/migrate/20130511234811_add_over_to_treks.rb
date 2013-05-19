class AddOverToTreks < ActiveRecord::Migration
  def change
    add_column :treks, :over, :boolean, default: false
  end
end
