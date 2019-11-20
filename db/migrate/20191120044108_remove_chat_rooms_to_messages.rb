class RemoveChatRoomsToMessages < ActiveRecord::Migration[5.2]
  def change
    remove_reference :messages, :chat_rooms, foreign_key: true
  end
end
