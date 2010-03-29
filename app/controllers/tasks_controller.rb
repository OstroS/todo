class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def create
    task = Task.new(params[:task]) #tworzenie nowego taska zgodnie z tablica 
    task.save

    redirect_to :action => :index
  end
  
  def show
    @task = Task.find(params[:id])
  end
end
