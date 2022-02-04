require_relative '../config/environment'
require_relative 'spec_helper'

describe Phone, type: :model do
  describe 'phone creation' do
    before :all do
      @user = User.create(user_name: 'Joao')
      @contact = @user.contacts.create(c_name: 'Jose')
      @contact.phones.create!(number: '999999999', phonekind: 'work', is_main: true)
    end

    after :all do
      Phone.destroy_all
      Contact.destroy_all
      User.destroy_all
    end

    it 'is successful' do
      phone = @contact.phones.new(number: '888888888', phonekind: 'work', is_main: false)
      expect(phone).to be_valid
    end

    it 'fails on is_main' do
      phone = @contact.phones.new(number: '888888888', phonekind: 'work', is_main: true)
      expect(phone).not_to be_valid
    end

    it 'fails on existing number' do
      phone = @contact.phones.new(number: '999999999', phonekind: 'work', is_main: false)
      expect(phone).not_to be_valid
    end
  end
end
