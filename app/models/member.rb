class Member < ApplicationRecord
  belongs_to :user
  belongs_to :guild
end
