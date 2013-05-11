class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :full_name, :email, :phone_number, :password, :password_confirmation

  validates_presence_of :full_name
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_uniqueness_of :phone_number
  validates_presence_of :phone_number
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create

  has_many :emergency_contacts
  has_many :trips

  def username=(val)
    write_attribute(:email, val.downcase)
  end

  def start_trip duration
    trip = trips.create(default_duration: duration)
    trip.start
  end
end
