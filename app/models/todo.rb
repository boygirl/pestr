class Todo < ActiveRecord::Base
  attr_accessible :priority, :team_id, :title
end
