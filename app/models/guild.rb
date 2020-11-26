class Guild < ApplicationRecord
  belongs_to :quest
  belongs_to :creator, class_name: 'User'
  has_many :members
  has_many :posts
  has_many :pistes, -> { where(category: ['piste', 'piste_publiee']) }, source: :posts
  has_many :orgas, -> { where(caterogy: 'orga') }, source: :posts

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true

  after_create :create_membership_for_creator

  def create_membership_for_creator
    Member.create(guild: self, user: creator, accepted: true, cover_letter: "c'est moi qui l'ait fait")
  end
end
