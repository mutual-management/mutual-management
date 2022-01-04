class ExpenseCategory < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { maximum: 16 }

  scope :active, -> {where(delete_flag: false)}
end
