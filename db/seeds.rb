Task.delete_all
User.delete_all
Assignment.delete_all
TaskList.delete_all

@user = User.create! :first_name => "Test", :last_name => "Seed", :alias_name => "Tester", :email => "test@example.com", :password => 'password', :password_confirmation => 'password'

5.times do |n|
  @user.personal_task_list.tasks.create! :subject => Faker::Lorem.sentence(7), :description => Faker::Lorem.paragraph(3)
end

5.times do |n|
  @user.personal_task_list.tasks.create!(:subject => Faker::Lorem.sentence(7), :description => Faker::Lorem.paragraph(3)).tap {|task| task.complete!}
end

5.times do |n|
  @user.personal_task_list.tasks.create!(:subject => Faker::Lorem.sentence(7), :description => Faker::Lorem.paragraph(3)).tap {|task| task.cancel!}
end

5.times do |n|
  @user.personal_task_list.tasks.create!(:subject => Faker::Lorem.sentence(7), :description => Faker::Lorem.paragraph(3)).tap {|task| task.expire!}
end

3.times do |n|
  @user.task_lists.create!(:name => "Task List #{n+1}").tap do |task_list|
    5.times do |n|
      task_list.tasks.create! :subject => Faker::Lorem.sentence(7), :description => Faker::Lorem.paragraph(3)
    end

    5.times do |n|
      task_list.tasks.create!(:subject => Faker::Lorem.sentence(7), :description => Faker::Lorem.paragraph(3)).tap {|task| task.complete!}
    end

    5.times do |n|
      task_list.tasks.create!(:subject => Faker::Lorem.sentence(7), :description => Faker::Lorem.paragraph(3)).tap {|task| task.cancel!}
    end

    5.times do |n|
      task_list.tasks.create!(:subject => Faker::Lorem.sentence(7), :description => Faker::Lorem.paragraph(3)).tap {|task| task.expire!}
    end
  end
end

