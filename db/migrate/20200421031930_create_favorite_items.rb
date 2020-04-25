class CreateFavoriteItems < ActiveRecord::Migration[6.0]
  def change
    create_table :favorite_items do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
