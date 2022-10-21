require 'todo'

RSpec.describe Todo do
  it 'constructs' do
    todo = Todo.new("Feed the dog")
    expect(todo).to eq "Feed the dog"
  end
end

