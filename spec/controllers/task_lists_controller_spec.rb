require 'spec_helper'

describe TaskListsController do
  login_user
  before(:each) { @controller.current_user }

  let!(:task_list) { @user.task_lists.create! Factory.attributes_for(:task_list) }
  let(:other_user) { Factory(:user) }

  def valid_attributes
    Factory.attributes_for(:task_list)
  end
  
  def valid_session
    {}
  end

  describe "GET show" do
    it "assigns the requested task_list as @task_list" do
      @controller.current_user
      get :show, {:id => task_list.to_param}, valid_session
      assigns(:task_list).should eq(task_list)
    end

    it "raises access denied when not assigned to the user" do
      other_user_task_list = other_user.task_lists.create! Factory.attributes_for(:task_list)
      expect {
        get :show, {:id => other_user_task_list.to_param}
      }.to raise_error(CanCan::AccessDenied)
    end

    it "raises access denied when not logged in" do
      sign_out @user
      expect {
        get :show, {:id => task_list.to_param}
      }.to raise_error(CanCan::AccessDenied)
    end
  end

  describe "GET new" do
    it "assigns a new task_list as @task_list" do
      get :new, {}, valid_session
      assigns(:task_list).should be_a_new(TaskList)
    end

    it "raises access denied when not logged in" do
      sign_out @user
      expect {
        get :new
      }.to raise_error(CanCan::AccessDenied)
    end
  end

  describe "GET edit" do
    it "assigns the requested task_list as @task_list" do
      get :edit, {:id => task_list.to_param}, valid_session
      assigns(:task_list).should eq(task_list)
    end

    it "raises access denied if not on the task list" do
      other_user_task_list = other_user.task_lists.create! Factory.attributes_for(:task_list)
      expect {
        get :edit, {:id => other_user_task_list.to_param}
      }.to raise_error(CanCan::AccessDenied)
    end

    it "raises access denied if not logged in" do
      sign_out @user
      expect {
        get :edit, {:id => task_list.to_param}
      }.to raise_error(CanCan::AccessDenied)
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

      it "assigns the new task list to the current user" do
        post :create, {:task_list => valid_attributes}, valid_session
        assigns(:task_list).users.should eq([@user])
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved task_list as @task_list" do
        # Trigger the behavior that occurs when invalid params are submitted
        TaskList.any_instance.stub(:valid?).and_return(false)
        post :create, {:task_list => {}}, valid_session
        assigns(:task_list).should be_a_new(TaskList)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        TaskList.any_instance.stub(:valid?).and_return(false)
        post :create, {:task_list => {}}, valid_session
        response.should render_template("new")
      end
    end

    it "raises access denied if not logged in" do
      sign_out @user
      expect {
        post :create, {:task => {}}
      }.to raise_error(CanCan::AccessDenied)
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested task_list" do
        TaskList.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => task_list.to_param, :task_list => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested task_list as @task_list" do
        put :update, {:id => task_list.to_param, :task_list => valid_attributes}, valid_session
        assigns(:task_list).should eq(task_list)
      end

      it "redirects to the task_list" do
        put :update, {:id => task_list.to_param, :task_list => valid_attributes}, valid_session
        response.should redirect_to(task_list)
      end
    end

    describe "with invalid params" do
      it "assigns the task_list as @task_list" do
        TaskList.any_instance.stub(:valid?).and_return(false)
        put :update, {:id => task_list.to_param, :task_list => {}}, valid_session
        assigns(:task_list).should eq(task_list)
      end

      it "re-renders the 'edit' template" do
        TaskList.any_instance.stub(:valid?).and_return(false)
        put :update, {:id => task_list.to_param, :task_list => {}}, valid_session
        response.should render_template("edit")
      end
    end

    it "raises access denied if not assigned to the task" do
      other_user_task_list = other_user.task_lists.create! Factory.attributes_for(:task_list)
      expect {
        put :update, {:id => other_user_task_list.to_param, :task_list => {}}
      }.to raise_error(CanCan::AccessDenied)
    end

    it "raises access denied if not logged in" do
      sign_out @user
      expect {
        put :update, {:id => task_list.to_param, :task_list => {}}
      }.to raise_error(CanCan::AccessDenied)
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested task_list" do
      expect {
        delete :destroy, {:id => task_list.to_param}, valid_session
      }.to change(TaskList, :count).by(-1)
    end

    it "redirects to the user profile" do
      delete :destroy, {:id => task_list.to_param}, valid_session
      response.should redirect_to(user_path(@user))
    end

    it "raises access denied if not assigned to the task" do
      other_user_task_list = other_user.task_lists.create! Factory.attributes_for(:task_list)
      expect {
        delete :destroy, {:id => other_user_task_list.to_param}
      }.to raise_error(CanCan::AccessDenied)
    end

    it "raises access denied if not logged in" do
      sign_out @user
      expect {
        delete :destroy, {:id => task_list.to_param}
      }.to raise_error(CanCan::AccessDenied)
    end
  end
end
