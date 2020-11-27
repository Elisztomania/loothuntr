class Quest < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_one :guild

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true, length: { minimum: 30 }
  validates :location, presence: true
  validates :creator, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

end
