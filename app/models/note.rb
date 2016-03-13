class Note < ActiveRecord::Base
  belongs_to :user

  validates :user_id, :title, :body, presence: true
  validates :title, length: {minimum: 10}
end
