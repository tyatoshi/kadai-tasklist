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
    if @task.save
      flash[:success] = 'Message が正常に投稿されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Message が投稿されませんでした'
      render :new
    end
  end
  
  def edit
    @task = Task.find_by(id: params[:id])
    
  end
  
  def update
    @task = Task.find_by(id: params[:id])
    if @task.update(task_params)
      flash[:success] = 'Message が正常に更新されました'
      redirect_to @task      
    else
      flash.now[:danger] = 'Message は更新されませんでした'
      render :edit
    end
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
