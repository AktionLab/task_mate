class TaskListsController < ApplicationController
  # GET /task_lists
  # GET /task_lists.json
  def index
    @task_lists = TaskList.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @task_lists }
    end
  end

  # GET /task_lists/1
  # GET /task_lists/1.json
  def show
    @task_list = TaskList.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task_list }
    end
  end

  # GET /task_lists/new
  # GET /task_lists/new.json
  def new
    @task_list = TaskList.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task_list }
    end
  end

  # GET /task_lists/1/edit
  def edit
    @task_list = TaskList.find(params[:id])
  end

  # POST /task_lists
  # POST /task_lists.json
  def create
    @task_list = TaskList.new(params[:task_list])

    respond_to do |format|
      if @task_list.save
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
    @task_list = TaskList.find(params[:id])

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
    @task_list = TaskList.find(params[:id])
    @task_list.destroy

    respond_to do |format|
      format.html { redirect_to task_lists_url }
      format.json { head :no_content }
    end
  end
end
