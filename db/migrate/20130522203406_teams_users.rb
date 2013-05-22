class TeamsUsers < ActiveRecord::Migration
  def change
    create_table :teams_users, id: false do |t|
      t.integer :team_id, :user_id
    end
  end
end
