class Trip < ActiveRecord::Base
  attr_accessor :duration
  belongs_to :user

  validates_presence_of :user
  validate :duration_is_greater_than_zero, before: :create

  #validate :expected_end_is_after_created_time
  after_create :calculate_expected_end_at

  scope :filter_ended_trips, where("expected_end_at > ? ", Time.now).order(:expected_end_at)

  def self.create_trip_with_duration user_id, duration
    user = User.find_by_id(user_id)

    Trip.new.tap do |trip|
      trip.user = user
      trip.duration = duration
      trip.save
    end

  end

  def time_up?
    Time.now >= expected_end_at
  end

  private
  def duration_is_greater_than_zero
    if duration && duration <= 0
      errors[:duration] = "Duration must be greater 0"
    end
  end

# def expected_end_is_after_created_time
#   if expected_end_at <= created_at
#     errors[:expected_end_at] = "Expected end time cannot be before start time"
#   end
# end

 def calculate_expected_end_at
   self.expected_end_at = created_at + duration
   #this is janky..
   save
 end

end
