class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.integer :user_id,  null: false
      t.string :name,      null: false
      t.datetime :time,    null: false
      t.integer :calories, null: false
    end
  end
end
