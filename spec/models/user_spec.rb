require_relative '../../config/environment'
require_relative '../spec_helper'

describe User do
  describe 'user creation' do
    after :all do
      User.destroy_all
    end

    it 'is successful' do
      user = User.new(user_name: 'Joao')
      expect(user).to be_valid
    end

    it 'fails on existing name' do
      User.create!(user_name: 'Joao')
      user = User.new(user_name: 'Joao')
      expect(user).not_to be_valid
    end

    it 'fails with no user_name' do
      user = User.new(user_name: nil)
      expect(user).not_to be_valid
    end
  end
end
