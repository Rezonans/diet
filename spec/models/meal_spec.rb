require 'rails_helper'

RSpec.describe User, :type => :model do
  before(:each) do
    @meal_today_2 = create(:meal, time: DateTime.now.change({ hour: 2, min: 0, sec: 0, :offset => '+0000' }))
    @meal_1_day_ago_4 = create(:meal, time: DateTime.now.change({ hour: 4, min: 0, sec: 0, :offset => '+0000' }) - 1.day)
    @meal_2_days_ago_6 = create(:meal, time: DateTime.now.change({ hour: 6, min: 0, sec: 0, :offset => '+0000' }) - 2.day)
  end
  describe 'time filters' do

    it 'works correct for time only' do
      meals = Meal.time_filter({ 'from' => DateTime.now.change({ hour: 1, min: 0, sec: 0, :offset => '+0000' }).strftime('%T'),
                                 'to'   => DateTime.now.change({ hour: 5, min: 0, sec: 0, :offset => '+0000' }).strftime('%T') }, :time).to_a
      expect(meals).to include(@meal_today_2)
      expect(meals).to include(@meal_1_day_ago_4)
      expect(meals).not_to include(@meal_2_days_ago_6)
    end
    it 'work corrent for date only' do
      meals = Meal.time_filter({ 'from' => (DateTime.now - 1.day).to_date ,
                                 'to'   => DateTime.now.to_date}, :date).to_a
      expect(meals).to include(@meal_today_2)
      expect(meals).to include(@meal_1_day_ago_4)
      expect(meals).not_to include(@meal_2_days_ago_6)
    end
    it 'works correct for both time and date' do
      meals = Meal.time_filter({ 'from' => '03:00:00',
                                 'to'   => '08:00:00' }, :time).
                   time_filter({ 'from' => (DateTime.now - 1.day).to_date ,
                                 'to'   => DateTime.now.to_date}, :date).to_a
      expect(meals).not_to include(@meal_today_2)
      expect(meals).to include(@meal_1_day_ago_4)
      expect(meals).not_to include(@meal_2_days_ago_6)
    end
  end
end
