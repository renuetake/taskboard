class TasksController < ApplicationController
  before_action :require_user_logged_in
  
  def index
    @tasks = current_user.tasks.where.not(status_id: 3) # status_id = 3 は '終了'
  end
  
  def new
    @task = current_user.tasks.new
  end

  def create
    @task = current_user.tasks.new(
      category: current_user.categories.find_by(id: task_params[:category]),
      name: task_params[:name],
      status: Status.find_by(id: task_params[:status]),
      priority: Priority.find_by(id: task_params[:priority]),
      start: task_params[:start],
      deadline: task_params[:deadline]
      )
    if @task.save
      # 連続で追加する場合もありそうなので、取り合えずtask#newに飛ばす
      flash[:success] = 'タスクを追加しました。'
      redirect_to new_task_path
    else
      # 失敗した場合もとりあえずtask#newに飛ばす
      flash[:danger] = 'タスクの追加に失敗しました。'
      render :new
    end
  end

  def edit
    set_task
  end
  
  def update
    set_task
    
    if @task.update(
      category: current_user.categories.find_by(id: task_params[:category]),
      name: task_params[:name],
      status: Status.find_by(id: task_params[:status]),
      priority: Priority.find_by(id: task_params[:priority]),
      start: task_params[:start],
      deadline: task_params[:deadline]
      )
      # 連続で更新する場合もありそうなので、取り合えずtask#newに飛ばす
      flash[:success] = 'タスクを更新しました。'
      redirect_to tasks_path
    else
      # 失敗した場合もとりあえずtask#newに飛ばす
      flash[:danger] = 'タスクの更新に失敗しました。'
      render :edit
    end
  end

  def set_child
    @tasks = current_user.tasks.reject { |task| task.parents.include?(task) and task.id != params[:id] }
  end

  
  def include_finished
    @tasks = current_user.tasks.all
  end
  
  private   
  
  def task_params
    params.require(:task).permit(:category, :name, :status, :priority, :start, :deadline)
  end
  
  def set_task
    @task = current_user.tasks.find(params[:id])
  end
end
