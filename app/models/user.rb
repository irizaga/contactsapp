class User < ApplicationRecord
  validates :user_name, presence: true, uniqueness: true
  has_many :contacts
  has_many :phones, through: :contacts
end
