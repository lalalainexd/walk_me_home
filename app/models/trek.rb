class Trek < ActiveRecord::Base
  attr_accessible :started_at, :expected_end_at
  belongs_to :trip
  has_one :user, through: :trip
  validates_presence_of :expected_end_at, :started_at
  validate :expected_end_at_is_after_started_at

  def start duration
    self.tap do |trek|
      time = Time.now
      trek.started_at = time
      trek.expected_end_at = time + duration
      save
    end
  end

  def stop
    self.over = true
    save
  end

  def pending_end?
    !over? && !in_progress?
  end

  def in_progress?
    !over && Time.now < expected_end_at
  end

  def extend_time extra_time
    if extra_time >= 0
      self.expected_end_at += extra_time
      save
    end
    self.expected_end_at
  end

  private

  def expected_end_at_is_after_started_at
    if expected_end_at < started_at
      errors.add(:expected_end_at, 'Expected end at must be after Started at')
    end

  end

end
