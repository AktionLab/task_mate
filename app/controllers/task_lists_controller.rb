class TaskListsController < ApplicationController
  load_and_authorize_resource

  # GET /task_lists/1
  # GET /task_lists/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task_list }
    end
  end

  # GET /task_lists/new
  # GET /task_lists/new.json
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task_list }
    end
  end

  # GET /task_lists/1/edit
  def edit
  end

  # POST /task_lists
  # POST /task_lists.json
  def create
    respond_to do |format|
      if @task_list.save
        current_user.task_lists << @task_list
        format.html { redirect_to @task_list, notice: 'Task list was successfully created.' }
        format.json { render json: @task_list, status: :created, location: @task_list }
      else
        format.html { render action: "new" }
        format.json { render json: @task_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /task_lists/1
  # PUT /task_lists/1.json
  def update
    respond_to do |format|
      if @task_list.update_attributes(params[:task_list])
        format.html { redirect_to @task_list, notice: 'Task list was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task_lists/1
  # DELETE /task_lists/1.json
  def destroy
    @task_list.destroy

    respond_to do |format|
      format.html { redirect_to current_user }
      format.json { head :no_content }
    end
  end
end
