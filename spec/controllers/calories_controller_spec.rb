require 'rails_helper'


RSpec.describe CaloriesController, type: :controller do
  login_user
  
  describe 'GET index' do

    before(:each) do
      [
          '2015-02-22 10:00:00 +0000',
          '2015-02-22 11:00:00 +0000',
          '2015-02-22 12:00:00 +0000',
          '2015-02-23 10:00:00 +0000',
          '2015-02-23 11:00:00 +0000',
          '2015-02-23 18:00:00 +0000'
      ].each do |date_string|
        create(:meal, user: @user, time: Time.parse(date_string), calories: 1)
      end
    end

    it 'shows statistics for specific user' do
      get :index, {user_token: @user_token, user_id: @user.id}
      expect(response).to be_success
    end

    it 'shows statistics with time filter' do
      get :index, {
                    user_token: @user_token,
                    user_id: @user.id,
                    time_from: '9:00',
                    time_to: '13:00'
                }
      json = JSON.parse(response.body)
      expect([json[0]['calories_sum'], json[1]['calories_sum']]).to match_array([3, 2])
    end

    it 'shows statistics with date' do
      get :index, {
                    user_token: @user_token,
                    user_id: @user.id,
                    date_from: '2015-02-22',
                    date_to: '2015-02-22'
                }
      json = JSON.parse(response.body)
      expect(json.length).to eq(1)
    end

    it 'have no access to foreign meals stat' do
      user2 = create(:user)
      get :index, {user_token: UserAuthHelper.jwt_token(user2), user_id: user2.id}
      json = JSON.parse(response.body)
      expect(json.length).to eq(0)
    end

  end
end
