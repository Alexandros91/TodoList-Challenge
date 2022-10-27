require 'todo_list'

RSpec.describe TodoList do
  it 'constructs' do
    todo_list = TodoList.new
    expect(TodoList).to respond_to(:new)
  end

  


end