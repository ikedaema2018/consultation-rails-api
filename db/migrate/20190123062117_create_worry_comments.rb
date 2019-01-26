class CreateWorryComments < ActiveRecord::Migration[5.2]
  def change
    create_table :worry_comments do |t|
      t.string :comment
      t.integer :user_id
      t.timestamps
    end
  end
end
