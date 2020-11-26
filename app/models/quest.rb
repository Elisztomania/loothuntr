class Quest < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_one :guild
  has_many :posts, through: :guild
  has_many :avancees, -> { where(category: 'avancee') }, through: :guild, source: :posts

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true, length: { minimum: 30 }
  validates :location, presence: true
  validates :creator, presence: true

end
