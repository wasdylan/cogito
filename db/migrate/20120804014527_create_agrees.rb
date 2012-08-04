class CreateAgrees < ActiveRecord::Migration
  def change
    create_table :agrees do |t|
      t.integer :user_id
      t.integer :post_id

      t.timestamps
    end
  end
end
