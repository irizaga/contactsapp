require_relative '../config/environment'
require_relative 'spec_helper'

describe Contact, type: :model do
  describe 'contact creation' do
    before :all do
      @user = User.create(user_name: 'Joao')
      @contact = @user.contacts.create(c_name: 'Jose')
    end

    after :all do
      Contact.destroy_all
      User.destroy_all
    end

    it 'is successful' do
      contact = @user.contacts.new(c_name: 'Maria')
      expect(contact).to be_valid
    end

    it 'fails' do
      contact = @user.contacts.new(c_name: 'Jose')
      expect(contact).not_to be_valid
    end
  end
end
