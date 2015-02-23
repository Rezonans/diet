require 'rails_helper'


RSpec.describe MealsController, type: :controller do
  login_user
  
  describe 'GET index' do
    let(:user_2) {create(:user)}

    before(:each) do
      3.times.map { create(:meal, user: @user) }
      2.times.map { create(:meal, user: user_2) }
    end

    it 'returns http success' do
      get :index, {user_token: @user_token, user_id: @user.id}
      expect(response).to be_success
    end

    it 'returns list of meals' do
      get :index, { user_token: @user_token, user_id: @user.id }
      meals = JSON.parse(response.body)['resources']
      expect(meals).to be_a_kind_of(Array)
    end

    it 'returns correct number of meals' do
      get :index, user_token: @user_token, user_id: @user.id
      meals = JSON.parse(response.body)['resources']
      expect(meals.count).to eq(3)
    end
  end

  describe 'GET show' do
    before(:each) do
      @meal = create(:meal, user: @user)
    end

    it 'returns http success' do
      get :show, {id: @meal.to_param, user_token: @user_token }
      expect(response).to be_success
    end

    it 'returns meal data' do
      get :show, {id: @meal.to_param, user_token: @user_token }
      meal = JSON.parse(response.body)['resource']
      expect(meal['name']).to eql(@meal.name)
      expect(meal['calories']).to eql(@meal.calories)
    end

  end

  describe 'POST create' do
    let(:valid_params) {
      {
          name: Faker::Lorem.word,
          time: Faker::Date.between(2.days.ago, Date.today),
          calories: Faker::Number.number(3),
      }
    }
    let(:invalid_params) {
      {
          time: Faker::Date.between(2.days.ago, Date.today),
          calories: Faker::Number.number(3),
      }
    }

    describe 'with valid params' do
      it 'creates a new meal' do
        expect {
          post :create, { resource: valid_params, user_token: @user_token }
        }.to change{ Meal.count }.by(1)
      end

      it 'returns meal in json' do
        post :create, {resource: valid_params, user_token: @user_token}
        meal = JSON.parse(response.body)['resource']
        expect(meal['name']).to eq(valid_params[:name])
      end
    end

    describe 'with invalid params' do
      it 'returns errors' do
        post :create, {resource: invalid_params, user_token: @user_token}
        json = JSON.parse(response.body)
        expect(json).to have_key('errors')
      end
    end
  end

  describe 'PUT update' do
    describe 'with valid params' do
      let(:new_attributes) {
        { name: 'New Test terminal' }
      }
      let(:meal) {
        create(:meal, user: @user)
      }
      it 'updates the requested meal' do
        put :update, {id: meal.to_param, resource: new_attributes, user_token: @user_token}
        meal.reload
        expect(meal.name).to eq(new_attributes[:name])
      end

      it 'returns changed meal in response' do
        put :update, {id: meal.to_param, resource: new_attributes, user_token: @user_token}
        meal = JSON.parse(response.body)['resource']

        expect(meal['name']).to eq(new_attributes[:name])
      end
    end
  end

  describe'DELETE destroy' do
    let(:meal) {
      create(:meal, user: @user)
    }

    it 'destroys the requested meal' do
      meal =  create(:meal, user: @user)
      expect {
        delete :destroy, {id: meal.to_param, user_token: @user_token}
      }.to change{Meal.count}.by(-1)
    end
  end
end
