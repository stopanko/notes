class User < ActiveRecord::Base
  has_many :notes, dependent: :destroy

  validates :email, :login, :full_name, :name, :birthday, :phone, presence: true
  validates :login, uniqueness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
