require 'resque/tasks'
require 'resque_scheduler/tasks'

task "resque:setup" => :environment do
  #place one time jobs here
  #example
  #Resque.enqueue_in(10.second, Orderharge, user_id: 1)
end
