class Item < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true, 
                    numericality: { greater_than: 0 }

  has_many :comments
  belongs_to :category

  has_one_attached :cover

  default_scope { where(deleted_at: nil) }

  def destroy
    update(deleted_at: Time.now)
  end
end

