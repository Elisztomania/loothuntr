class Quest < ApplicationRecord
  belongs_to :creator, class_name: 'User'

  validates :title, presence: true, uniqueness: true
  # validates :description, presence: true, length: { minimun: 30 }
  validates :location, presence: true
  validates :creator, presence: true

end
