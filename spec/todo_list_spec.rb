require 'todo_list'

RSpec.describe TodoList do
  context 'initialy' do
    it 'has an empty list of tasks' do
      todo_list = TodoList.new
      expect(todo_list.incomplete).to eq []
    end

    it 'has an empty list of completed tasks' do
      todo_list = TodoList.new
      expect(todo_list.complete).to eq []
    end

    it 'returns an empty list of completed task when we give up' do
      todo_list = TodoList.new
      expect(todo_list.give_up!).to eq []
    end
  end
end