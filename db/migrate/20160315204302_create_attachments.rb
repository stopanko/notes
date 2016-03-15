class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.integer :note_id
      t.attachment :file
      t.timestamps null: false
    end
  end
end
