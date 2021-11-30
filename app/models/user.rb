class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  validates :username, presence:true ,uniqueness: true
  has_many :posts
  has_many :events
  has_many :images
  has_many :comments
  belongs_to :role

  before_validation :set_role

  def set_role
    if self.role == nil
      self.role_id = 2
    end
  end
end
