Task.delete_all
User.delete_all
Assignment.delete_all

@user = User.create! :first_name => "Test", :last_name => "Seed", :alias_name => "Tester", :email => "test@example.com", :password => 'password', :password_confirmation => 'password'

3.times do |n|
  User.create!(:first_name => "Test", :last_name => "Seed", :alias_name => "Tester#{n}", :email => "test-#{n}@example.com", :password => 'password', :password_confirmation => 'password').tap do |user|
    user.tasks.create! :subject => "Foo", :description => "Bar"
  end
end

