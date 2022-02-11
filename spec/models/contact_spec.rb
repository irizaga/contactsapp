require_relative '../../config/environment'
require_relative '../spec_helper'

RSpec.describe Contact, type: :model do
  before :all do
    @user = User.create!(user_name: 'Joao')
    @contact = @user.contacts.create!(c_name: 'Jose')
  end

  after :all do
    Contact.destroy_all
    User.destroy_all
  end

  describe 'creation' do
    context 'is successful' do
      it 'given new contact name' do
        contact = @user.contacts.new(c_name: 'Maria')
        expect(contact).to be_valid
      end
    end

    context 'fails' do
      it 'given existing name' do
        contact = @user.contacts.new(c_name: 'Jose')
        expect(contact).not_to be_valid
      end
    end
  end
end
