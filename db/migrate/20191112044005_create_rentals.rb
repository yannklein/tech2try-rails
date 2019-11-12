class CreateRentals < ActiveRecord::Migration[5.2]
  def change
    create_table :rentals do |t|
      t.date :start
      t.date :end
      t.references :renter, foreign_key: { to_table: :users }
      t.references :rentee, foreign_key: { to_table: :users }
      t.references :techget, foreign_key: true

      t.timestamps
    end

  end
end
