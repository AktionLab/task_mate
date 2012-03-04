require 'spec_helper'

describe TasksController do
  login_user

  let!(:task) { @user.tasks.create! Factory.attributes_for(:task) }

  describe "GET show" do
    it "assigns the requested task as @task" do
      get :show, {:id => task.to_param}
      assigns(:task).should eq(task)
    end
  end

  describe "GET new" do
    it "assigns a new task as @task" do
      get :new, {}
      assigns(:task).should be_a_new(Task)
    end
  end

  describe "GET edit" do
    it "assigns the requested task as @task" do
      get :edit, {:id => task.to_param}
      assigns(:task).should eq(task)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Task" do
        expect {
          post :create, {:task => Factory.attributes_for(:task)}
        }.to change(Task, :count).by(1)
      end

      it "assigns a newly created task as @task" do
        post :create, {:task => Factory.attributes_for(:task)}
        assigns(:task).should be_a(Task)
        assigns(:task).should be_persisted
      end

      it "redirects to the created task" do
        post :create, {:task => Factory.attributes_for(:task)}
        response.should redirect_to(Task.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved task as @task" do
        Task.any_instance.stub(:valid?).and_return(false)
        post :create, {:task => {}}
        assigns(:task).should be_a_new(Task)
      end

      it "re-renders the 'new' template" do
        Task.any_instance.stub(:valid?).and_return(false)
        post :create, {:task => {}}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested task" do
        Task.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => task.to_param, :task => {'these' => 'params'}}
      end

      it "assigns the requested task as @task" do
        put :update, {:id => task.to_param, :task => Factory.attributes_for(:task) }
        assigns(:task).should eq(task)
      end

      it "redirects to the task" do
        put :update, {:id => task.to_param, :task => Factory.attributes_for(:task) }
        response.should redirect_to(task)
      end
    end

    describe "with invalid params" do
      it "assigns the task as @task" do
        Task.any_instance.stub(:valid?).and_return(false)
        put :update, {:id => task.to_param, :task => {}}
        assigns(:task).should eq(task)
      end

      it "re-renders the 'edit' template" do
        Task.any_instance.stub(:valid?).and_return(false)
        put :update, {:id => task.to_param, :task => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested task" do
      expect {
        delete :destroy, {:id => task.to_param}
      }.to change(Task, :count).by(-1)
    end

    it "redirects to the tasks list" do
      delete :destroy, {:id => task.to_param}
      response.should redirect_to(tasks_url)
    end
  end
end

