class ChatRoom < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :rental
  has_many :user
end
