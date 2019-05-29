class PhoneNumber < ApplicationRecord
  belongs_to :user
  validates :p_number, presence: true, uniqueness: true, length: {is: 10}
end
