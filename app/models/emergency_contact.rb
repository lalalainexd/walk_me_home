class EmergencyContact < ActiveRecord::Base
  attr_accessible :user_id, :full_name, :phone_number

  validates_presence_of :user_id
  validates_presence_of :full_name
  validates_presence_of :phone_number

  belongs_to :user

end
