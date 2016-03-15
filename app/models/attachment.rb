class Attachment < ActiveRecord::Base
  belongs_to :note

  validates :file, :note_id, presence: true
  has_attached_file :file, :styles => lambda { |attachment|
                           !attachment.instance.image? ? {} : {medium: "300x300>", thumb: "100x100>", _50_50: '50x50>'}
                         }
  validates_attachment_content_type :file, content_type: ['image/jpeg', 'image/png',
                                                          'image/jpg', 'image/bmp',
                                                          'video/mp4', 'video/avi',
                                                          "application/pdf","application/vnd.ms-excel",
                                                          "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
                                                          "application/msword",
                                                          "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
                                                          "text/plain"]

  def image?
    file.content_type.index("image/") == 0
  end
end
