class Task < ActiveRecord::Base
  belongs_to :project
  enum priority: {red: 3, yellow: 2, white: 1}
  def deadline_format
    deadline.strftime("%d %b") unless deadline.nil?
  end

  def deadline_format=(deadline)
    self.deadline = Date.parse(deadline)
  end
end
