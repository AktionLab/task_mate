class UsersController < ApplicationController
  load_and_authorize_resource
  before_filter :set_scope

  # GET /users/1
  # GET /users/1.json
  def show
    if params[:task_list]
      @tasks = @user.task_lists.find(params[:task_list]).tasks.send(@scope)
    else
      @tasks = @user.personal_task_list.tasks.send(@scope)
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

private
  
  def set_scope
    @scope = 'current' and return if params[:scope].nil? or not valid_scope(params[:scope])
    @scope = params[:scope]
  end

  def valid_scope(scope)
    %w(current completed cancelled expired).include? scope
  end
end

