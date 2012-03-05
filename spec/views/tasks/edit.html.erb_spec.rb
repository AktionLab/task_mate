require 'spec_helper'

describe "tasks/edit" do
  before(:each) do
    @user = stub_model(User)
    @controller.stub(:current_user => @user)
    @task = assign(:task, stub_model(Task,
      :subject => "MyString",
      :description => "MyText",
      :state => "MyString"
    ))
  end

  it "renders the edit task form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tasks_path(@task), :method => "post" do
      assert_select "input#task_subject", :name => "task[subject]"
      assert_select "textarea#task_description", :name => "task[description]"
      assert_select "select#task_due_at_1i", :name => "task[due_at(1i)]"
      assert_select "select#task_due_at_2i", :name => "task[due_at(2i)]"
      assert_select "select#task_due_at_3i", :name => "task[due_at(3i)]"
      assert_select "select#task_due_at_4i", :name => "task[due_at(4i)]"
      assert_select "select#task_due_at_5i", :name => "task[due_at(5i)]"
    end
  end

  it "has a link to show the task" do
    render
    rendered.should have_selector("a[href='/tasks/#{@task.to_param}']")
  end

  it "has a link to go back to the users show action" do
    render
    rendered.should have_selector("a[href='/users/#{@user.to_param}']")
  end
end
