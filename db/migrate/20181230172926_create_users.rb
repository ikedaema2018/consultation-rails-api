class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :password_confirmation
      t.string :gender
      t.integer :age
      t.string :introduction

      t.timestamps
    end
  end
end
