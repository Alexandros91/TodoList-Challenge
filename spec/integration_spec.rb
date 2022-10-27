require 'todo'
require 'todo_list'

RSpec.describe 'integration' do
  describe '#add' do
    context 'when we add one task' do
      it 'adds the task to the list' do
      todo_list = TodoList.new
      todo = Todo.new("Water the plants")
      expect(todo_list.add(todo)).to eq [todo]
      end
    end

    context 'when we add multiple tasks' do
      it 'adds all tasks to the list' do
        todo_list = TodoList.new
        todo_1 = Todo.new("Water the plants")
        todo_2 = Todo.new("walk the dog")
        todo_list.add(todo_1)
        expect(todo_list.add(todo_2)).to eq [todo_1, todo_2]
      end
    end
  end
 
  describe '#incomplete' do
    xit 'returns the todo as incomplete' do
      todo_list = TodoList.new
      todo_1 = Todo.new("Water the plants")
      todo_list.add(todo_1)
      expect(todo_list.incomplete).to eq ["Water the plants"]
    end

    xit 'returns all the non-done todos' do
      todo_list = TodoList.new
      todo_1 = Todo.new("Water the plants")
      todo_2 = Todo.new("Walk the dog")
      todo_3 = Todo.new("Wash the dishes")
      todo_list.add(todo_1)
      todo_list.add(todo_2)
      todo_list.add(todo_3)
      todo_1.mark_done!
      todo_2.mark_done!
      expect(todo_list.incomplete).to eq ["Wash the dishes"]
    end
  end

  describe '#complete' do
    context 'when the list is empty' do
      it 'returns nothing' do
        todo_list = TodoList.new
        todo_1 = Todo.new("Water the plants")
        expect(todo_list.complete).to eq []
      end
    end

    context 'when we do not mark a task as done' do  
      it 'returns nothing' do
        todo_list = TodoList.new
        todo_1 = Todo.new("Water the plants")
        todo_list.add(todo_1)
        expect(todo_list.complete).to eq []
      end
    end

    context 'when we have one task and it is completed' do
      it 'returns the todo as complete' do
        todo_list = TodoList.new
        todo_1 = Todo.new("Water the plants")
        todo_list.add(todo_1)
        todo_1.mark_done!
        expect(todo_list.complete).to eq ["Water the plants"]
      end
    end

    context 'when we have multiple tasks' do
      it 'returns the completed tasks only' do
        todo_list = TodoList.new
        todo_1 = Todo.new("Water the plants")
        todo_2 = Todo.new("Walk the dog")
        todo_3 = Todo.new("Wash the dishes")
        todo_list.add(todo_1)
        todo_list.add(todo_2)
        todo_list.add(todo_3)
        todo_1.mark_done!
        todo_2.mark_done!
        expect(todo_list.complete).to eq ["Water the plants", "Walk the dog"]
      end
    end
  end

  describe '#give_up!' do
    it 'marks all tasks as complete' do
      todo_list = TodoList.new
      todo_1 = Todo.new("Water the plants")
      todo_2 = Todo.new("Walk the dog")
      todo_3 = Todo.new("Wash the dishes")
      todo_list.add(todo_1)
      todo_list.add(todo_2)
      todo_list.add(todo_3)
      todo_list.give_up!
      expect(todo_list.complete).to eq ["Water the plants", "Walk the dog", "Wash the dishes"]
    end

    xit 'marks no task as incomplete' do
      todo_list = TodoList.new
      todo_1 = Todo.new("Water the plants")
      todo_2 = Todo.new("Walk the dog")
      todo_3 = Todo.new("Wash the dishes")
      todo_list.add(todo_1)
      todo_list.add(todo_2)
      todo_list.add(todo_3)
      todo_list.give_up!
      expect(todo_list.incomplete).to eq []
    end
  end
end
