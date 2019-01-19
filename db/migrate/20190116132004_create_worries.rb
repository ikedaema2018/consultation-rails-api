class CreateWorries < ActiveRecord::Migration[5.2]
  def change
    create_table :worries do |t|
      t.string :worry, null: false
      t.integer :user_id, null: false
      t.boolean :resolve_flag, default: false
      t.timestamps
    end
  end
end
