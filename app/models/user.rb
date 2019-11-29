class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :techgets
  # has_many :rentals, foreign_key: :renter_id
  has_many :messages
  belongs_to :chat_room, required: false
  mount_uploader :photo, PhotoUploader
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def rentals
    Rental.where("renter_id = ? OR rentee_id= ?", self.id, self.id)
  end
end
