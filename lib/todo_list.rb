class TodoList
  def initialize
    @list = []
    @completed_todos = []
  end

  def add(todo) 
    @list << todo
  end

  def incomplete
    # @list.map do |todo|
    #   if todo.done? == true
    #     @list.delete(todo)
    #   end
    # end
  end

  def complete
    @list.map do |todo|
      if todo.done? == true
        @completed_todos << todo.mark_done!
      end
    end
    return @completed_todos.flatten.uniq
  end

  def give_up!
    @list.map do |todo|
      @completed_todos << todo.mark_done!
    end
    if @completed_todos.flatten.uniq.empty?
      return []
    else
      return @completed_todos.flatten.uniq
    end
  end
end