class Topic < ApplicationRecord
  belongs_to :user

  validates :content, presence: true, length: { maximum: 163 }
  validates :month, presence: true
end
