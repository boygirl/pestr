class Todo < ActiveRecord::Base
  attr_accessible :team_id, :what, :when, :member_id, :created_at

  belongs_to :team
  validates :what, presence: true

  def when_string
    if self.when == 1
      "eventually"
    elsif self.when == 2
      "this week"
    elsif self.when == 3
      "today"
    else
      "eventually"
    end
  end

  def who_string
    if self.member_id == 0
      "Someone"
    else
      "#{Member.find(self.member_id).name}"
    end
  end
end

