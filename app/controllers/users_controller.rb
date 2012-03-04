class UsersController < ApplicationController
  load_and_authorize_resource

  # GET /users/1
  # GET /users/1.json
  def show
    @tasks = @user.tasks

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end
end

