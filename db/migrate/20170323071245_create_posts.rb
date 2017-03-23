class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.belongs_to :users, index: true
      t.string :post_photo
      t.string :description
      t.float :price

      t.timestamps
    end
  end
end
