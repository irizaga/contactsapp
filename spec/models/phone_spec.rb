require_relative '../../config/environment'
require_relative '../spec_helper'

RSpec.describe Phone, type: :model do
  before :all do
    @user = User.create!(user_name: 'Joao')
    @contact = @user.contacts.create!(c_name: 'Jose')
    @contact.phones.create!(number: '999999999', phonekind: 'work', is_main: true)
  end

  after :all do
    Phone.destroy_all
    Contact.destroy_all
    User.destroy_all
  end

  describe 'creation' do
    context 'is successful' do
      it 'given no conflicting fields' do
        phone = @contact.phones.new(number: '888888888', phonekind: 'work', is_main: false)
        expect(phone).to be_valid
      end
    end

    context 'fails' do
      it 'given another is_main=true' do
        phone = @contact.phones.new(number: '888888888', phonekind: 'work', is_main: true)
        expect(phone).not_to be_valid
      end

      it 'given existing number' do
        phone = @contact.phones.new(number: '999999999', phonekind: 'work', is_main: false)
        expect(phone).not_to be_valid
      end
    end
  end
end
