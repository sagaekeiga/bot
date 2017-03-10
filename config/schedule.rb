env :PATH, ENV['PATH']
require File.expand_path(File.dirname(__FILE__) + "/environment")
job_type :rbenv_rake, %q!eval "$(rbenv init -)"; cd :path && :environment_variable=:environment bundle exec rake :task --silent :output!

set :output, 'log/crontab.log'
set :environment, :production


#2時間ごとに動かす
every 5.minutes do
   rake 'crawl:crawl'
end