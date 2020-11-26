class Post < ApplicationRecord
  belongs_to :user
  belongs_to :guild

  CATEGORY = ["orga", "piste", "avancee"]

  validates :title, presence: true
  validates :description, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORY }
end
