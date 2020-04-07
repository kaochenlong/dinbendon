class Item < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true, 
                    numericality: { greater_than: 0 }
  belongs_to :category

  has_one_attached :cover
end
