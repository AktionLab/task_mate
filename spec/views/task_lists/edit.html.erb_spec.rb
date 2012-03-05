require 'spec_helper'

describe "task_lists/edit" do
  before(:each) do
    @task_list = assign(:task_list, stub_model(TaskList,
      :name => "MyString"
    ))
  end

  it "renders the edit task_list form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => task_lists_path(@task_list), :method => "post" do
      assert_select "input#task_list_name", :name => "task_list[name]"
    end
  end
end
