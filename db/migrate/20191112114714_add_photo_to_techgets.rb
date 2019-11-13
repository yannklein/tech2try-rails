class AddPhotoToTechgets < ActiveRecord::Migration[5.2]
  def change
    add_column :techgets, :photo, :string
  end
end
