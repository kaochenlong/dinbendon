class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.datetime :begin_at
      t.datetime :end_at

      t.timestamps
    end
  end
end
