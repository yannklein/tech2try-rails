class AddConfirmedToRentals < ActiveRecord::Migration[5.2]
  def change
    add_column :rentals, :confirmed, :boolean
  end
end
