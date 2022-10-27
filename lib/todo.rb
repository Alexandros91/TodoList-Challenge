class Todo

  attr_reader :task

  def initialize(task) # task is a string
    @task = task
    @done = false
  end

  def mark_done!
    @done = true
  end

  def done?
    return @done
  end
end