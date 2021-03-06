class CategoriesController < ApplicationController
  before_action :require_user_logged_in
  
  def new
    @category = current_user.categories.new
  end

  def create
    @category = current_user.categories.new(category_params)
    if @category.save
      flash[:success] = 'カテゴリを新規追加しました。'
      redirect_to new_category_path
    else
      flash[:danger] = 'カテゴリの追加に失敗しました。'
      render :new
    end
  end
  
  def destroy
    category = current_user.categories.find(params[:id])
    category.destroy
    flash[:success] = 'カテゴリを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private 
  
  def category_params
    params.require(:category).permit(:category)
  end
end
