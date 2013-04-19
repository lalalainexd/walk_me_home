class User < ActiveRecord::Base
  attr_accessible :username, :phone_number

  has_many :emergency_contacts
end
