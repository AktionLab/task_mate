require 'spec_helper'

describe RootController do
  describe 'GET #index' do
    describe 'when not logged in' do
      it "should redirect to sign in if not logged in" do
        get :index
        response.should redirect_to(new_user_session_path)
      end
    end

    describe 'when logged in' do
      login_user
      it 'should show the current users profile' do
        get :index
        response.should render_template('users/show')
      end

      it 'should assign @user with current_user' do
        get :index
        assigns(:user).should eq(@user)
      end

      it 'should assign @tasks with the users tasks' do
        task = Factory.create(:task)
        @user.tasks << task
        get :index
        assigns(:tasks).should eq([task])
      end
    end
  end
end
