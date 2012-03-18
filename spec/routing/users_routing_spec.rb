require "spec_helper"

describe UsersController do
  describe "routing" do
    it "routes user alias URLs to #show" do
      get("/user_alias").should route_to("users#show", :id => "user_alias")
    end
  end
end
