class Parcel < ApplicationRecord
  belongs_to :student, class_name: "User"

  enum status: {
    pending: 0,
    found: 1,
    awaiting_payment: 2,
    paid: 3,
    in_delivery: 4,
    delivered: 5,
    disputed: 6
   }

  validates :tracking_number, presence: true, uniqueness: true
  validates :student, presence: true
end
