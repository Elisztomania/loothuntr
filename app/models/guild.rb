class Guild < ApplicationRecord
  belongs_to :quest
  belongs_to :creator, class_name: 'User'
end
