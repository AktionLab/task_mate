require 'spec_helper'

describe "tasks/new" do
  before(:each) do
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
    end
  end
end
