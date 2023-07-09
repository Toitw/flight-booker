class Booking < ApplicationRecord
  belongs_to :flight
  has_many :passengers, inverse_of: :booking
  accepts_nested_attributes_for :passengers

  validates :num_passengers, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
