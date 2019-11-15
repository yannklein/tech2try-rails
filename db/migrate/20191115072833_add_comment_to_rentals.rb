class AddCommentToRentals < ActiveRecord::Migration[5.2]
  def change
    add_column :rentals, :comment, :string
  end
end
