class Schedule < ApplicationRecord
  belongs_to :user

  enum labelColor: { red: 0, blue: 1, yellow: 2, puple: 3, green: 4 }

  validates :title, presence: true, length: { maximum: 255 }
  validates :time, presence: true
  validates :label_color, presence: true
  validates :date, presence: true
end
