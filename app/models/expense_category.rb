class ExpenseCategory < ApplicationRecord
  belongs_to :user

  validate :title, length: { maximum: 16 }
end
