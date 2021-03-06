require 'rails_helper'


RSpec.describe UsersController, type: :controller do
  login_user
  describe 'GET show' do

    it 'returns http success' do
      get :show, {id: @user.to_param, user_token: @user_token }
      expect(response).to be_success
    end

    it 'returns user data' do
      get :show, {id: @user.to_param, user_token: @user_token }
      user = JSON.parse(response.body)['resource']
      expect(user['daily_calories_limit']).to eql(@user.daily_calories_limit)

    end

  end

  describe 'PUT update' do
    describe 'with valid params' do
      let(:new_attributes) {
        { daily_calories_limit: 1000 }
      }
      let(:user_2) {
        create(:user)
      }
      it 'updates the requested user' do
        put :update, {id: @user.to_param, resource: new_attributes, user_token: @user_token}
        @user.reload
        expect(@user.daily_calories_limit).to eq(new_attributes[:daily_calories_limit])
      end

      it 'returns changed user in response' do
        put :update, {id: @user.to_param, resource: new_attributes, user_token: @user_token}
        user = JSON.parse(response.body)['resource']
        expect(user['daily_calories_limit']).to eq(new_attributes[:daily_calories_limit])
      end

      it 'allow update only own attributes' do
        put :update, {id: user_2.to_param, resource: new_attributes, user_token: @user_token}
        error = JSON.parse(response.body)['errors']
        expect(error).to eq('You are not authorized to access this page.')
      end
    end
  end
end
