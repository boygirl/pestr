class Team < ActiveRecord::Base
  attr_accessible :name

  has_many :todos
  has_many :members

  validates :name, presence: true
end
