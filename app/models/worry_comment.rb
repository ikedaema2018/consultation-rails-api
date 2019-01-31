class WorryComment < ApplicationRecord
  validates :comment, presence: true
  validates :user_id, presence: true
  validates :worry_id, presence: true

  belongs_to :worry
end
