require 'spec_helper'

describe TaskListsController do

  def valid_attributes
    Factory.attributes_for(:task_list)
  end
  
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all task_lists as @task_lists" do
      task_list = TaskList.create! valid_attributes
      get :index, {}, valid_session
      assigns(:task_lists).should eq([task_list])
    end
  end

  describe "GET show" do
    it "assigns the requested task_list as @task_list" do
      task_list = TaskList.create! valid_attributes
      get :show, {:id => task_list.to_param}, valid_session
      assigns(:task_list).should eq(task_list)
    end
  end

  describe "GET new" do
    it "assigns a new task_list as @task_list" do
      get :new, {}, valid_session
      assigns(:task_list).should be_a_new(TaskList)
    end
  end

  describe "GET edit" do
    it "assigns the requested task_list as @task_list" do
      task_list = TaskList.create! valid_attributes
      get :edit, {:id => task_list.to_param}, valid_session
      assigns(:task_list).should eq(task_list)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new TaskList" do
        expect {
          post :create, {:task_list => valid_attributes}, valid_session
        }.to change(TaskList, :count).by(1)
      end

      it "assigns a newly created task_list as @task_list" do
        post :create, {:task_list => valid_attributes}, valid_session
        assigns(:task_list).should be_a(TaskList)
        assigns(:task_list).should be_persisted
      end

      it "redirects to the created task_list" do
        post :create, {:task_list => valid_attributes}, valid_session
        response.should redirect_to(TaskList.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved task_list as @task_list" do
        # Trigger the behavior that occurs when invalid params are submitted
        TaskList.any_instance.stub(:save).and_return(false)
        post :create, {:task_list => {}}, valid_session
        assigns(:task_list).should be_a_new(TaskList)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        TaskList.any_instance.stub(:save).and_return(false)
        post :create, {:task_list => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested task_list" do
        task_list = TaskList.create! valid_attributes
        # Assuming there are no other task_lists in the database, this
        # specifies that the TaskList created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        TaskList.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => task_list.to_param, :task_list => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested task_list as @task_list" do
        task_list = TaskList.create! valid_attributes
        put :update, {:id => task_list.to_param, :task_list => valid_attributes}, valid_session
        assigns(:task_list).should eq(task_list)
      end

      it "redirects to the task_list" do
        task_list = TaskList.create! valid_attributes
        put :update, {:id => task_list.to_param, :task_list => valid_attributes}, valid_session
        response.should redirect_to(task_list)
      end
    end

    describe "with invalid params" do
      it "assigns the task_list as @task_list" do
        task_list = TaskList.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        TaskList.any_instance.stub(:save).and_return(false)
        put :update, {:id => task_list.to_param, :task_list => {}}, valid_session
        assigns(:task_list).should eq(task_list)
      end

      it "re-renders the 'edit' template" do
        task_list = TaskList.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        TaskList.any_instance.stub(:save).and_return(false)
        put :update, {:id => task_list.to_param, :task_list => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested task_list" do
      task_list = TaskList.create! valid_attributes
      expect {
        delete :destroy, {:id => task_list.to_param}, valid_session
      }.to change(TaskList, :count).by(-1)
    end

    it "redirects to the task_lists list" do
      task_list = TaskList.create! valid_attributes
      delete :destroy, {:id => task_list.to_param}, valid_session
      response.should redirect_to(task_lists_url)
    end
  end

end
