class Phone < ApplicationRecord
  belongs_to :contact
  validates :number, presence: true, uniqueness: { scope: :contact_id }
  validates :phonekind, presence: true
  validates :is_main, inclusion: [true, false]
  validates :is_main, exclusion: [nil]
  validates :is_main, uniqueness: { scope: :contact_id, conditions: -> { where.not(is_main: false) } }
end
