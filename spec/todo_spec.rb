require 'todo'

RSpec.describe Todo do
  describe '#task' do
    it 'returns the task' do
      todo = Todo.new("Feed the dog")
      expect(todo.task).to eq "Feed the dog"
    end
  end

  describe '#mark_done!' do
    context 'when we have one todo' do
      it 'marks the todo as done' do
        todo_1 = Todo.new("Feed the dog")
        expect(todo_1.mark_done!).to eq ["Feed the dog"]
      end
    end

    context 'when we have multiple todos' do
      it 'marks the todo we mark as done' do
        todo_1 = Todo.new("Feed the dog")
        todo_2 = Todo.new("Wash dishes")
        todo_3 = Todo.new("water the plants")
        expect(todo_2.mark_done!).to eq ["Wash dishes"]
      end
    end
  end

  describe '#done?' do
    it 'returns true if the task is done' do
      todo_1 = Todo.new("Feed the dog")
      todo_1.mark_done!
      expect(todo_1.done?).to eq true
    end

    it 'returns false if the task is not done' do
      todo_1 = Todo.new("Feed the dog")
      expect(todo_1.done?).to eq false
    end
  end
end

