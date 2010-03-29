class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def create
    task = Task.new(params[:tasks]) #tworzenie nowego taska zgodnie z tablica 
    task.save

    redirect_to :action => :index
  end
end
