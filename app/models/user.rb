class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :quests, foreign_key: 'creator_id', dependent: :destroy
  has_many :guilds, foreign_key: 'creator_id', dependent: :destroy

  # validates :username, presence: true, uniqueness: true
  # validates :bio, presence: true
end
