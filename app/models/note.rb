class Note < ActiveRecord::Base
  belongs_to :user
  has_many :photos, dependent: :destroy
  has_many :videos, dependent: :destroy

  validates :user_id, :title, :body, presence: true
  validates :title, length: {minimum: 10}
end
