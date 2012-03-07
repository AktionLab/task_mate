require 'spec_helper'

describe UsersController do
  login_user

  describe "GET show" do
    describe "for the current_user" do
      it "assigns the requested user as @user" do
        get :show, {:id => @user.to_param}
        assigns(:user).should eq(@user)
      end

      it "assigns the request users's tasks as @tasks" do
        tasks = 3.times.inject([]) { |t,i| t + [Factory(:assignment, :assignable => @user)] }.map(&:task)
        get :show, {:id => @user.to_param}
        assigns(:tasks).should eq(tasks)
      end
    end

    describe "for other users" do
      it 'should deny access' do
        other_user = Factory.create(:user)
        expect { 
          get :show, {:id => other_user.to_param}
        }.to raise_error(CanCan::AccessDenied)
      end
    end
  end
end

