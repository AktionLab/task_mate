require "spec_helper"

describe TaskListsController do
  describe "routing" do

    it "routes to #index" do
      get("/task_lists").should route_to("task_lists#index")
    end

    it "routes to #new" do
      get("/task_lists/new").should route_to("task_lists#new")
    end

    it "routes to #show" do
      get("/task_lists/1").should route_to("task_lists#show", :id => "1")
    end

    it "routes to #edit" do
      get("/task_lists/1/edit").should route_to("task_lists#edit", :id => "1")
    end

    it "routes to #create" do
      post("/task_lists").should route_to("task_lists#create")
    end

    it "routes to #update" do
      put("/task_lists/1").should route_to("task_lists#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/task_lists/1").should route_to("task_lists#destroy", :id => "1")
    end

  end
end
