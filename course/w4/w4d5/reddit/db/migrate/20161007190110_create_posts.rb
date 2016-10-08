class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false, index: true
      t.string :url, index: true
      t.text :content
      t.integer :author_id, null: false

      t.timestamps null: false
    end
  end
end
