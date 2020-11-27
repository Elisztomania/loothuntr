class Post < ApplicationRecord
  belongs_to :user
  belongs_to :guild
  has_many :comments, dependent: :destroy
  has_many_attached :photos


  CATEGORY = ["orga", "piste", "piste_publiee", "avancee"]

  validates :title, presence: true
  validates :description, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORY }
end
