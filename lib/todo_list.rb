class TodoList
  def initialize
   @list = []
  end

  def add(todo) 
    @list << todo
  end

  def incomplete
    return @list.reject do |task|
      task.done?
    end
  end

  def complete
    return @list.select do |task|
      task.done?
    end
  end

  def give_up!
    return @list.map do |task|
      task.mark_done!
    end
  end
end