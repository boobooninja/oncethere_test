require 'rails_helper'

RSpec.describe Task, type: :model do
  it 'validates the presence of duration' do
    expect(Task.new(duration: 5)).to be_a(Task)
    expect(Task.create.persisted?).to eq(false)
  end

  describe 'max_time' do
    it 'returns the maximum time required to complete all tasks' do
      task1 = Task.create duration: 2
      task2 = task1.subtasks.create duration: 5
      task3 = Task.create duration: 6

      expect(Task.max_time).to eq(task1.duration + task2.duration)
    end
  end
end
