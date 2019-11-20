class AddRentalToChatRooms < ActiveRecord::Migration[5.2]
  def change
    add_reference :chat_rooms, :rental, foreign_key: true
  end
end
