class TasksController < ApplicationController
  
  def index
    @tasks =Task.all.order(created_at: :desc)
  end
  
  def show
    @task = Task.find_by(id: params[:id])
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to("/")
  end
  
  def edit
    @task = Task.find_by(id: params[:id])
    
  end
  
  def update
    @task = Task.find_by(id: params[:id])
    @task.update(task_params)
    redirect_to("/")
  end
  
  def destroy
     @task = Task.find_by(id: params[:id])
     @task.destroy
     redirect_to("/")
  end
  
  private
  
  def task_params
    params.require(:task).permit(:content)
  end
  
end
