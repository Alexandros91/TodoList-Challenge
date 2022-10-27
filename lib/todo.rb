class Todo

  attr_reader :task

  def initialize(task) # task is a string
    @task = task
    @todos_done = []
  end

  def mark_done!
    @todos_done << @task
  end

  def done?
   @todos_done.include?(@task) ? true : false
  end
end