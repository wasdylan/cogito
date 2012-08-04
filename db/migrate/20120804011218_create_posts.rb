class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.string :tags
      t.string :topic
      t.string :source
      t.integer :user_id

      t.timestamps
    end
  end
end
