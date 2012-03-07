require 'spec_helper'

describe RootController do
  describe "routing" do
    it "routes to #index" do
      get("/").should route_to("root#index")
    end
  end
end

