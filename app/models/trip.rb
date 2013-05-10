class Trip < ActiveRecord::Base
  attr_accessible :default_duration
  belongs_to :user

  validates_presence_of :user
  validate :duration_is_greater_than_zero, before: :create

  has_many :treks

  def start duration=nil
    treks.build.start(duration || default_duration)
  end

#  def self.create_trip_with_duration params
#    user = User.find_by_id(params[:user_id])
#    duration = params[:duration]
#    start_trip
#
#    Trip.new.tap do |trip|
#      trip.user = user
#      trip.duration = duration
#      trip.save
#    end
#
#  end

  private
  def duration_is_greater_than_zero
    if duration && duration <= 0
      errors[:duration] = "Duration must be greater 0"
    end
  end

end
