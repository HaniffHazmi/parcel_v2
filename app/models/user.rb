class User < ApplicationRecord
  enum role: { student: 0, staff: 1, admin: 2 }
  has_many :parcels, foreign_key: :student_id
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
