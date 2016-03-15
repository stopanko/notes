class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.integer :note_id
      t.attachment :video
      t.timestamps null: false
    end
  end
end
