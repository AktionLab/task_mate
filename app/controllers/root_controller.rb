class RootController < ApplicationController
  def index
    if user_signed_in?
      @user = current_user
      @tasks = @user.tasks
      render 'users/show'
    else
      redirect_to new_user_session_path
    end
  end
end
