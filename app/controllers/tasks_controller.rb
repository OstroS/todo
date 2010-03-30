class TasksController < ApplicationController
  layout 'task'
  
  def index
    @tasks = Task.all
    #render :layout => "task"
  end

  def create
    @task = Task.new(params[:task]) #tworzenie nowego taska zgodnie z tablica 
    if @task.save
      redirect_to :action => "index"  	#if task saved properly redirect to index 
    else				#if not -> get all of tasks and render action index
      flash[:error] = "Błąd! #" + @task.errors.each {|field, msg| puts msg}.to_s
      self.index
      render :action => "new"
    end
  end
  
  def show
    @task = Task.find(params[:id])
  end
  
  def new
    #render :partial => "form"
  end
end
