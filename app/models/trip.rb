class Trip < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :expected_end_at
end
