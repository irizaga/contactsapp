require_relative '../../config/environment'
require_relative '../spec_helper'

RSpec.describe User, type: :model do
  after :all do
    User.destroy_all
  end

  describe 'creation' do
    context 'is successful' do
      it 'given no conflicting fields' do
        user = User.new(user_name: 'Joao')
        expect(user).to be_valid
      end
    end

    context 'fails' do
      it 'given existing name' do
        User.create!(user_name: 'Joao')
        user = User.new(user_name: 'Joao')
        expect(user).not_to be_valid
      end

      it 'given no user_name' do
        user = User.new(user_name: nil)
        expect(user).not_to be_valid
      end
    end
  end
end
