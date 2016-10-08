class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :title, null: false, index: true
      t.string :url, null: false
      t.integer :user_id, null: false, index: true
      t.integer :comment_id

      t.timestamps null: false
    end
  end
end
