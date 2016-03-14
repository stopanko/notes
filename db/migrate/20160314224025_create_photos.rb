class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :note_id
      t.attachment :image
      t.timestamps null: false
    end
  end
end
