class Texts < ActiveRecord::Migration
  def change

    create_table :texts do |t|
      t.string :phone_number
    end
  end
end