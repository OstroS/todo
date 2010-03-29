class TasksControllerController < ApplicationController
  def index
    @tasks = Task.all
  end
end
