class DailyStack < ApplicationRecord
  belongs_to :expense_category
  belongs_to :user

  enum status: { todo: 0, done: 1 }
  enum unit: { study: 0, expense: 1, others: 2 }

  validates :title, presence: true, length: { maximum: 50 }
  validates :status, presence: true
  validates :date, presence: true
  validates :unit, presence: true

end
