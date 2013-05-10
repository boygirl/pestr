class Todo < ActiveRecord::Base
  attr_accessible :team_id, :what, :when, :member_id, :created_at

  belongs_to :team
end
