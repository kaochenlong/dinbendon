class Event < ApplicationRecord
  has_many :histories
  has_many :users, through: :histories
end
