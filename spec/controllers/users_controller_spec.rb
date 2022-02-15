require_relative '../rails_helper'
require_relative '../../config/environment'

RSpec.describe UsersController, type: :controller do
  describe 'GET index' do
    it 'has a 200 status code' do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe 'user listing' do
    before :all do
      User.create!(user_name:'Joao')
    end

    after :all do
      User.destroy_all
    end

    it 'returns the right user count' do
      get :index
      user = assigns :users
      expect(user.length).to eq(1)
    end
  end
end
