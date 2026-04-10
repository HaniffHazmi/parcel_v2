class Parcel < ApplicationRecord
  belongs_to :resident, class_name: "User"
  before_validation :set_default_status, om: :create

  enum :status, {
    pending: 0,
    found: 1,
    awaiting_payment: 2,
    paid: 3,
    in_delivery: 4,
    delivered: 5,
    disputed: 6
   }

  def set_default_status
    self.status ||= :pending
  end

  validates :tracking_number, presence: true, uniqueness: true
  validates :resident, presence: true
end
