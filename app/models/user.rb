class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, 
                       confirmation: true, 
                       length: { minimum: 4 }

  has_many :histories
  has_many :events, through: :histories
end
