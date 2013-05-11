class Trek < ActiveRecord::Base
  attr_accessible :started_at, :expected_end_at
  belongs_to :trip
  validate :expected_end_at_is_after_started_at

  def start duration
    self.tap do |trek|
      time = Time.now
      trek.started_at = time
      trek.expected_end_at = time + duration
      save
    end
  end

  private

  def expected_end_at_is_after_started_at
    if expected_end_at < started_at
      errors.add(:expected_end_at, 'Expected end at must be after Started at')
    end

  end

end
