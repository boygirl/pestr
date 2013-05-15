class Membership < ActiveRecord::Base
  attr_accessible :email, :member_id, :name, :phone, :team_id
end
