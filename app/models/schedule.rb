class Schedule < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { maximum: 255 }
  validates :time, presence: true,
  validates :labelColor, presence: true,
  validates :date, presence: true,
end
