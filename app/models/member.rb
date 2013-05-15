class Member < ActiveRecord::Base
  attr_accessible :confirmed, :name, :phone, :team_id

  belongs_to :team
end
