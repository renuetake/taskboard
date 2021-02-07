class RelationshipsController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    parent_task = current_user.tasks.find(params[:id])
    child_task = Task.find(params[:child_task_id])
    if parent_task.set_child(child_task) == nil
      flash[:danger] = 'タスクを子タスクに設定できませんでした。'
      redirect_back(fallback_location: root_path)
    else
      flash[:success] = 'タスクを子タスクに設定しました。'
      redirect_to tasks_path
    end
  end

  def destroy
    parent_task = current_user.tasks.find(params[:parent_id])
    child_task = current_user.tasks.find(params[:child_task_id])
    parent_task.unset_child(child_task)
    flash[:success] = '子タスクの設定を解除しました。'
    redirect_to tasks_path
  end
end
