class User < ApplicationRecord
  authenticates_with_sorcery!
  
  has_many :expense_categories, dependent: :destroy
  has_many :daily_stacks, dependent: :destroy
  has_many :topics, dependent: :destroy
  has_many :schedule, dependent: :destroy
  has_many :monthly_target, dependent: :destroy
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :email, uniqueness: true
end
