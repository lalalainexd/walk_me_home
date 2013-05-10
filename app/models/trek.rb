class Trek < ActiveRecord::Base
  attr_accessible :started_at, :expected_end_at
  belongs_to :trip

  def start duration
    self.tap do |trek|
      trek.started_at = Time.now
      trek.expected_end_at = Time.now + duration
      save
    end
  end

end
