class ApplicationController < ActionController::Base
  include SessionsHelper

  def counts(user)
    @count_tasks = user.tasks.all.count
    @count_finished_tasks = user.tasks.all.where(status_id: 3).count
    unless @count_tasks == 0
      # 登録タスクが0個ではない場合に割合を算出
      @count_finished_rate = @count_finished_tasks.to_f / @count_tasks.to_f * 100.0
    else
      @count_finished_rate = 0.0
    end
    # @count_finished_rate = @count_finished_tasks.to_f / @count_tasks.to_f * 100.0

  end

  private
  
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
end
