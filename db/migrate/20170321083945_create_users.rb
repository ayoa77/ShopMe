class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :about
      t.string :website
      t.integer :gender
      t.string :profile_photo

      t.timestamps
    end
  end
end
