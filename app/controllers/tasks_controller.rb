class TasksController < ApplicationController
  before_action :require_user_logged_in
  
  def new
    @task = current_user.tasks.new
    # カテゴリプルダウン用の配列 [["選択肢1", "実際にDBに保存させる内容"], ["選択肢２", "実際にDBに保存させる内容"]]
    # @categories = current_user.categories.all.map {|c| [c.category, c.id]}
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
  end

  def destroy
  end
  
  private 
  def task_params
    params.require(:task).permit(:category, :name, :status, :priority, :start, :deadline)
  end
end
