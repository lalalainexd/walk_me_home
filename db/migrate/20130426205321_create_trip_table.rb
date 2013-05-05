class CreateTripTable < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.timestamps
      t.references :user
      t.datetime :expected_end_at
    end
  end
end
