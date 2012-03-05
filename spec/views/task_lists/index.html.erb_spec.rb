require 'spec_helper'

describe "task_lists/index" do
  before(:each) do
    assign(:task_lists, [
      stub_model(TaskList,
        :name => "Name"
      ),
      stub_model(TaskList,
        :name => "Name"
      )
    ])
  end

  it "renders a list of task_lists" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
