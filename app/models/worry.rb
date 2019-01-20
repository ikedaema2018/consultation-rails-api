class Worry < ApplicationRecord
  validates :worry, presence: true
  validates :user_id, presence: true

  belongs_to :user
end
