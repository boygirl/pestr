class Team < ActiveRecord::Base
  attr_accessible :name

  has_many :todos

  validates :name, presence: true
end
