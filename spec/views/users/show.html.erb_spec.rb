require 'spec_helper'

describe "users/show" do
  before(:each) do
    @task1 = stub_model(Task, :id => 1, :subject => "Task1", :description => "Description1")
    @task2 = stub_model(Task, :id => 2, :subject => "Task2", :description => "Description2")
    assign(:tasks, [@task1, @task2])
    @user = assign(:user, stub_model(User,
      :first_name => "First Name",
      :last_name => "Last Name",
      :alias => "Alias"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should match(/First Name/)
    rendered.should match(/Last Name/)
    rendered.should match(/Alias/)
  end

  describe "tasks" do
    before(:each) { render }

    it "has a #tasks element" do
      rendered.should match(/id="tasks"/)
    end

    it "has dom ids for each task" do
      rendered.should match(/id="task_1"/)
      rendered.should match(/id="task_2"/)
    end

    it "renders the task subject" do
      rendered.should match(/Task1/)
      rendered.should match(/Task2/)
    end

    it "renders the task description" do
      rendered.should match(/Description1/)
      rendered.should match(/Description2/)
    end

    it "renders elements with classes matching field names" do
      rendered.should match(/class="(?:.+ )?subject.*"/)
      rendered.should match(/class=".*description.*"/)
    end
  end
end

