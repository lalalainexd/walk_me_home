class Trip < ActiveRecord::Base
  belongs_to :user

  def self.create_trip_with_duration user_id, duration

  end
end
