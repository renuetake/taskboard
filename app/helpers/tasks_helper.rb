module TasksHelper
  def parent_name_or_blank(task)
    if task.parents.first == nil
      return ''
    else
      return task.parents.first.name
    end
  end
  
  def is_child_task?(task, target_id)
    if task.parents.first == nil
      return false
    end

    return(task.parents.first.id == target_id.to_i)
  end
end
