class Topic < ApplicationRecord
  belongs_to :user

  validates :content, presence: true, length: { maximum: 163 }
  validates :month, presence: true

  def this_month(month)
    if month
      day = month.to_date
      month_firstday = day.beginning_of_month
      month_lastday = day.to_date.end_of_month
      Range.new(month_firstday, month_lastday)
    else
      Time.zone.today.all_month
    end
  end
end
