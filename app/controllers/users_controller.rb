class UsersController < ApplicationController
  # ログインしてない状態でユーザ詳細ページに行かないようにする
  before_action :require_user_logged_in, only: [:show]
  
  def show
    @user = User.find(params[:id])
    counts(@user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      # categoriesテーブルに空データの登録(美しくない。。)
      # init_category(@user)
      redirect_to root_path
    else
      flash[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  def init_category(user)
    category = user.categories.build(category: ' ')
    category.save
  end
end
