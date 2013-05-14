class Todo < ActiveRecord::Base
  attr_accessible :team_id, :what, :when, :member_id, :created_at

  belongs_to :team
  validates :what, presence: true

  def when_string
    if self.when == 1
      "Eventually"
    elsif self.when == 2
      "This week"
    elsif self.when == 3
      "Today"
    else
      "Eventually"
    end
  end
end

