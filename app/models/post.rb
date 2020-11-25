class Post < ApplicationRecord
  belongs_to :user
  belongs_to :guild

  validates :title, presence: true
  validates :description, presence: true
end
