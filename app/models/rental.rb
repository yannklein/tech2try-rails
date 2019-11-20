class Rental < ApplicationRecord
  belongs_to :rentee, class_name: 'User'
  belongs_to :renter, class_name: 'User'
  belongs_to :techget
  has_one :chat_room
end
