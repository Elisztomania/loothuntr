class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :photo
  has_many :quests, foreign_key: 'creator_id', dependent: :destroy
  has_many :guilds, foreign_key: 'creator_id', dependent: :destroy
  has_many :members
  has_many :guilds_member, -> { where("members.accepted= true") }, through: :members, class_name: 'Guild', source: :guild
  has_many :guilds_applier, -> { where("members.accepted= false") }, through: :members, class_name: 'Guild', source: :guild
  has_many :posts

  validates :username, presence: true, uniqueness: true
  validates :bio, presence: true

  def is_member_of?(guild)
    guilds_member.include?(guild)
  end

  def has_apply_to?(guild)
    guilds_applier.include?(guild)
  end
end
