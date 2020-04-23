class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true

  has_many :histories
  has_many :events, through: :histories
  has_many :comments

  has_many :favorite_items
  has_many :items, through: :favorite_items

  def displayname
    self.nickname == "" ? self.email : self.nickname
  end

end
