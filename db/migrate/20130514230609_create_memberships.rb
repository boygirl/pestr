class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.integer :member_id
      t.integer :team_id
      t.string :email
      t.string :name
      t.string :phone

      t.timestamps
    end
  end
end
