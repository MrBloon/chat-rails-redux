class Channel < ApplicationRecord
  validates :name, presence: :true
  has_many :messages
end
