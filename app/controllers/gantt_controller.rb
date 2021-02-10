class GanttController < ApplicationController
  before_action :require_user_logged_in
  def index
  end
  
  def data
    tasks = current_user.tasks.all
    


    # logger.debug(Date.parse(tasks[0].start))


    
    render :json=>{
      :data => tasks.map{|task|{
        :id => task.id,
        :text => task.name,
        :start_date => task.start.to_formatted_s(:db),
        :duration => get_duration(task.start, task.deadline),
        :progress => nil,
        :parent => get_parentid_or_nil(task),
        :open => true,
        # 以下自分で追加
        :end_date => task.deadline.to_formatted_s(:db),
        :priority => task.priority.priority,
        :status => task.status.status,
        :parentName => get_parentName_or_nil(task)
      }}
    }
  end
  
  private
  
  def get_duration(start_date, end_date)
    (end_date - start_date).to_i
  end
  
  def get_parentid_or_nil(task)
    if task.has_parent?
      return task.parents.first.id
    else
      return nil
    end
  end
  
  def get_parentName_or_nil(task)
    if task.has_parent?
      return task.parents.first.name
    else
      return nil
    end
  end
end
