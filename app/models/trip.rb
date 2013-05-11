class Trip < ActiveRecord::Base
  attr_accessible :default_duration
  belongs_to :user

  validates_presence_of :user
  validate :duration_is_greater_than_zero, before: :create

  has_many :treks

  def start duration=nil
    treks.build.start(duration || default_duration)
  end

  private
  def duration_is_greater_than_zero
    if duration && duration <= 0
      errors[:duration] = "Duration must be greater 0"
    end
  end

end
