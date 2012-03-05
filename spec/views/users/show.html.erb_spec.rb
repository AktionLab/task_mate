require 'spec_helper'

describe "users/show" do

  before(:each) do
    @task1 = stub_model(Task, :id => 1, :subject => "Task1", :description => "Description1", :created_at => Time.now - 5.minutes)
    @task2 = stub_model(Task, :id => 2, :subject => "Task2", :description => "Description2", :created_at => Time.now - 10.minutes)
    assign(:tasks, [@task1, @task2])
    @user = assign(:user, stub_model(User,
      :first_name => "First Name",
      :last_name => "Last Name",
      :alias => "Alias",
      :new_record? => false
    ))

    @ability = Object.new
    @ability.extend(CanCan::Ability)
    @controller.stub(:current_ability => @ability)
  end

  it "renders attributes in <p>" do
    render
    rendered.should match(/First Name/)
    rendered.should match(/Last Name/)
    rendered.should match(/Alias/)
  end

  describe "tasks" do
    it "has a #tasks element" do
      render
      rendered.should have_selector('ul#tasks')
    end

    it "has dom ids for each task" do
      render
      rendered.should have_selector('li#task_1')
      rendered.should have_selector('li#task_2')
    end

    it 'has a task class on each task' do
      render
      rendered.should have_selector('li#task_1.task')
      rendered.should have_selector('li#task_2.task')
    end

    it "renders the task subject" do
      render
      rendered.should match(/Task1/)
      rendered.should match(/Task2/)
    end

    it "renders the task description" do
      render
      rendered.should match(/Description1/)
      rendered.should match(/Description2/)
    end

    it "renders the created at in time ago" do
      render
      rendered.should match(/Created 10 minutes ago/)
      rendered.should match(/Created 5 minutes ago/)
    end

    it "renders elements with classes matching field names" do
      render
      rendered.should have_selector('.subject')
      rendered.should have_selector('.description')
      rendered.should have_selector('.created_at')
    end

    describe "authorized actions" do
      it "does not include the edit link when not allowed" do
        render
        rendered.should_not have_selector(".edit.action")
      end

      it "include the edit link when allowed" do
        @ability.can :update, Task
        render
        rendered.should have_selector(".edit.action")
      end

      it "does not include the destroy link when not allowed" do
        render
        rendered.should_not have_selector(".destroy.action")
      end

      it "include the edit link when allowed" do
        @ability.can :destroy, Task
        render
        rendered.should have_selector(".destroy.action")
      end
    end
  end
end

