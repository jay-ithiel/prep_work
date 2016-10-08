class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :title, null: false, index: true
      t.string :url
      t.integer :user_id, null: false, index: true
      t.integer :comment_id, index: true

      t.timestamps null: false
    end
  end
end
