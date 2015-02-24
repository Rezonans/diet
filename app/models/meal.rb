class Meal < ActiveRecord::Base
  validates :name, :calories, :time, presence: true
  belongs_to :user

  scope :with_date, -> { select('DATE("meals"."time") AS date_only') }
  scope :with_calories_sum, -> { select('SUM("meals"."calories") AS calories_sum') }
  scope :group_by_date, -> { with_date.group('date_only') }

  scope :calories_statistic, -> { group_by_date.with_calories_sum.order('date_only') }

  scope :time_filter, -> (data, kind) do
    # date format '2015-02-17'
    # time format '10:01:45'

    if !data.nil? && [:date, :time].include?(kind)
      from = data['from']
      to = data['to']

      if from.present? && to.present?
        where("time::#{kind} >= ? and time::#{kind} <= ?", from, to )
      elsif from.present?
        where("time::#{kind} >= ?", from)
      elsif to.present?
        where("time::#{kind} <= ?", to)
      end
    end
  end
end
