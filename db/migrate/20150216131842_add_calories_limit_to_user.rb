class AddCaloriesLimitToUser < ActiveRecord::Migration
  def change
    add_column :users, :daily_calories_limit, :integer
  end
end
