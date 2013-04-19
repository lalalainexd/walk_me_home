class EmergencyContact < ActiveRecord::Base
  attr_accessible :user_id, :phone_number

  belongs_to :user
end
