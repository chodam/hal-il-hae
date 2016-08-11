# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

every 1.day,   :at => 'current_user.deadline' do 
  #1.minute 1.day 1.week 1.month 1.year is also supported
  #1. todo_list_id -1 의 todo_items의 
  if condition
    
  end
  rake "db"
  command "/usr/bin/my_great_command"
end


every 1.day, :at => '12 pm' do
  # do something
  if datetime>=current_user.deadline
    
    
  end
  
  
end


