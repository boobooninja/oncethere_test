class Task < ActiveRecord::Base
  has_many :subtasks, class_name: 'Task', foreign_key: 'parent_id'
  belongs_to :parent, class_name: 'Task'

  validates :duration, presence: true

  scope :has_parent, -> { where.not(:parent_id => nil) }
  scope :max_duration, -> { order("duration DESC").first }

  def self.max_time
    if Task.has_parent.any?
      task = has_parent.max_duration.parent
      task.subtasks.inject(task.duration) {|d, t| d += t.duration }
    else
      max_duration.duration
    end
  end
end
