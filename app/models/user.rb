require 'digest'
class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, 
                       confirmation: true, 
                       length: { minimum: 4 }

  has_many :histories
  has_many :events, through: :histories
  has_many :comments

  has_many :favorite_items
  has_many :items, through: :favorite_items

  before_create :encrypt_password
  
  def display_name
    if nickname.present?
      nickname
    else email
    end
  end

  private

  def encrypt_password
    self.password = Digest::SHA256.hexdigest(password)
  end

end
