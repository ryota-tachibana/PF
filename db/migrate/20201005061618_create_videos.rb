class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.integer :user_id
      t.integer :genre_id
      t.integer :category_id
      t.text :image_id
      t.text :summary
      t.boolean :spoiler, default: false, null: false

      t.timestamps
    end
  end
end
