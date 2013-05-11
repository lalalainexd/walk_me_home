class CreateTrekTable < ActiveRecord::Migration
  def change
    create_table :treks do |t|
      t.references :trip
      t.timestamp :started_at
      t.timestamp :expected_end_at

      t.timestamps
    end

    add_index :treks, :trip_id
  end

end
