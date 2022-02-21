require_relative '../rails_helper'
require_relative '../../config/environment'
require 'database_cleaner/active_record'

DatabaseCleaner.strategy = :truncation

RSpec.describe UsersController, type: :controller do
  describe 'GET index' do
    it 'has a 200 status code' do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe 'index page' do
    render_views

    context 'returns content' do
      it 'no result warning if user.length is 0' do
        get :index
        user = assigns :users
        expect(user.length).to eq(0)
        expect(response.body).to match '<h1 class="warning"> No results </h1>'
      end

      it 'user count if users exist' do
        DatabaseCleaner.start
        User.create!(user_name: 'Joao')
        get :index
        user = assigns :users
        expect(user.length).to eq(1)
        DatabaseCleaner.clean
      end
    end
  end
end
