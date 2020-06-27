class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :title
      t.text :body
      t.integer :strong
      t.integer :part
      t.string :start_image_id
      t.string :finish_image_id

      t.timestamps
    end
  end
end
