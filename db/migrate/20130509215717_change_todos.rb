class ChangeTodos < ActiveRecord::Migration
  def up
    remove_column :todos, :title
    add_column :todos, :what, :string
    add_column :todos, :member_id, :integer
    add_column :todos, :when, :integer
  end

  def down
    add_column :todos, :title
    remove_column :todos, :what, :string
    remove_column :todos, :member_id, :integer
    remove_column :todos, :when, :integer
  end
end
