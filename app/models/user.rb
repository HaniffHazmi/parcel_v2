class User < ApplicationRecord
  enum :role, { student: 0, staff: 1, admin: 2 }

  has_many :parcels, foreign_key: :resident_id

  before_validation :set_default_role, on: :create
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :matric_id, :level, :room_number, :phone_number,
          presence: true,
          unless: :admin?

  validates :matric_id, uniqueness: true, allow_nil: true
  validates :level, inclusion: { in: 0..3 }, allow_nil: true
  validates :room_number, inclusion: { in: 1..16 }, allow_nil: true

  private

  def set_default_role
    self.role ||= :student
  end
end
