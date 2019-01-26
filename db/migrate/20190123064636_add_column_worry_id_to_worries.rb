class AddColumnWorryIdToWorries < ActiveRecord::Migration[5.2]
  def up
    add_column :worry_comments, :worry_id, :integer
  end

  def down
    add_column :worry_comments, :worry_id, :integer
  end
end
