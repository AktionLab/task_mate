require 'spec_helper'

describe "task_lists/new" do
  before(:each) do
    assign(:task_list, stub_model(TaskList,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new task_list form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => task_lists_path, :method => "post" do
      assert_select "input#task_list_name", :name => "task_list[name]"
    end
  end
end
