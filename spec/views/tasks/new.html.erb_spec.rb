require 'spec_helper'

describe "tasks/new" do
  before(:each) do
    @user = stub_model(User, :alias_name => "Alias")
    @controller.stub(:current_user => @user)
    assign(:task, stub_model(Task,
      :subject => "MyString",
      :description => "MyText",
      :state => "MyString"
    ).as_new_record)
  end

  it "renders new task form" do
    render

    assert_select "form", :action => tasks_path, :method => "post" do
      assert_select "input#task_subject", :name => "task[subject]"
      assert_select "textarea#task_description", :name => "task[description]"
      assert_select "select#task_due_at_1i", :name => "task[due_at(1i)]"
      assert_select "select#task_due_at_2i", :name => "task[due_at(2i)]"
      assert_select "select#task_due_at_3i", :name => "task[due_at(3i)]"
      assert_select "select#task_due_at_4i", :name => "task[due_at(4i)]"
      assert_select "select#task_due_at_5i", :name => "task[due_at(5i)]"
    end
  end

  it "has a link to go back to the users show action" do
    render
    rendered.should have_selector("a[href='/users/#{@user.to_param}']")
  end
end

