class Member < ApplicationRecord
  belongs_to :user
  belongs_to :guild

  validates :cover_letter, presence: true, length: { in: 20..200 }

  scope :accepted, -> { where(accepted: true) }
  scope :waiting, -> { where(accepted: false) }

end
