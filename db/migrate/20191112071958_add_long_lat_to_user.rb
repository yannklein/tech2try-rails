class AddLongLatToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :lat, :float
    add_column :users, :long, :float
  end
end
