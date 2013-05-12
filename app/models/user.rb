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
  has_many :treks, through: :trips

  def username=(val)
    write_attribute(:email, val.downcase)
  end


  def start_trip duration
    trip = trips.create(default_duration: duration)
    trip.start
  end

  def extend_current_trip extra_time
    current_trek.extend_time(extra_time) if current_trek
  end

  def stop_current_trip
    current_trek.stop if current_trek
  end

  def current_trek
    treks.find{|t| t.in_progress? || t.pending_end?}

  end
end
