class RemoveChatRoomFromRentals < ActiveRecord::Migration[5.2]
  def change
    remove_reference :rentals, :chat_room, foreign_key: true
  end
end
