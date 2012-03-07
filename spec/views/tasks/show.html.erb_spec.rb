require 'spec_helper'

describe "tasks/show" do
  before(:each) do
    @user = stub_model(User, :alias_name => "Alias")
    @controller.stub(:current_user => @user)
    @task = assign(:task, stub_model(Task,
      :subject => "Subject",
      :description => "MyText",
      :state => "State"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should match(/Subject/)
    rendered.should match(/MyText/)
  end

  it "has a link to edit the task" do
    render
    rendered.should have_selector("a[href='/tasks/#{@task.to_param}/edit']")
  end

  it "has a link back to the user show page" do
    render
    rendered.should have_selector("a[href='/users/#{@user.to_param}']")
  end
end
