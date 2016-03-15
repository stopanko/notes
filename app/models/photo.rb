class Photo < ActiveRecord::Base
  belongs_to :note
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>", _50_50: '50x50>' }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  validates :image, :note_id, presence: true
end
