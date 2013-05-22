class Team < ActiveRecord::Base
  attr_accessible :name

  has_many :todos
  has_many :members
  has_and_belongs_to_many :users

  validates :name, presence: true

end
