class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :bookings
  has_many :citytours
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  acts_as_taggable_on :languages
end
