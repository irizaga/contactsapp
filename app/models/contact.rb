class Contact < ApplicationRecord
  validates :c_name, presence: true, uniqueness: { scope: :user_id }
  belongs_to :user
  has_many :phones
end
