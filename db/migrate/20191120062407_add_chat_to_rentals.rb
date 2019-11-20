class AddChatToRentals < ActiveRecord::Migration[5.2]
  def change
    add_reference :rentals, :chat_room, foreign_key: true
  end
end
