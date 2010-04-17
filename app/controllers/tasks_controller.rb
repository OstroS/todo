class TasksController < ApplicationController
  layout 'task'
  
  def index
    @tasks = Task.all
    @priorities = Priority.all
    #render :layout => "task"
  end

  def create
    # fakup - jak jest null to sie wyklada
    # trzeba sprawdzic czy jest nilem i jesli tak to olac priorytety
    # troche to chyba nieladne, no ale co zrobic ;/
    if params[:task].has_key?("priority")
      priority = Priority.find_by_id params[:task][:priority][:id]
    else
      priority = Priority.find_by_name("Normal")
    end
    params[:task].delete :priority
    @task = Task.new(params[:task])  
    @task.priority = priority;
    @task.save! 
    redirect_to :action => "index" 
				 
    #lapiemy wyjatki
    #rescue #lapie wszystkie wyjatki
    #  self.index
    #  render :action => :new
  end
  
  def show
    @task = Task.find(params[:id])
  end
  
  def new
    #render :partial => "form"
  end
  
  def destroy
    Task.find_by_id(params["task"]["id"]).destroy
    redirect_to :action => "index"
    
  rescue
    self.index
    render :action => "index"
  end
end
