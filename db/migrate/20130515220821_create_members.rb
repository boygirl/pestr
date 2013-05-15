class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.string :phone
      t.integer :team_id
      t.boolean :confirmed

      t.timestamps
    end
  end
end
