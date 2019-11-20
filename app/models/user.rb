class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :techgets
  has_many :rentals
  has_many :messages
  belongs_to :chat_room
  mount_uploader :photo, PhotoUploader
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
