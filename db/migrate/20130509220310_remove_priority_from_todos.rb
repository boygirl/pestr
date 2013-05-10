class RemovePriorityFromTodos < ActiveRecord::Migration
  def up
    remove_column :todos, :priority
  end

  def down
    add_column :todos, :priority, :integer
  end
end
