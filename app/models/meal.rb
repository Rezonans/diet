class Meal < ActiveRecord::Base
  validates :name, :calories, :time, presence: true
  belongs_to :user

  scope :time_filter, ->(data, kind) do
    # date format '2015-02-17'
    # time format '10:01:45'

    if !data.nil? && [:date, :time].include?(kind)
      from = data['from']
      to =data['to']

      if from.present? && to.present?
        where("time::#{kind} >= ? and  time::#{kind} <= ?", from, to )
      elsif from.present?
        where("time::#{kind} >= ?", from)
      elsif to.present?
        where("time::#{kind} <= ?", to)
      end
    end
  end

  scope :by_user, -> (user_id) do
    where(user_id: user_id) if user_id
  end

end
