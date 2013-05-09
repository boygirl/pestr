class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :title
      t.integer :priority
      t.integer :team_id

      t.timestamps
    end
    add_index :todos, :team_id
  end
end
