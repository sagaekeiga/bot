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
# ログの出力先を設定
require File.expand_path(File.dirname(__FILE__) + "/environment")

set :output, 'log/crontab.log'
# production 環境で cron 実行
env :PATH, '/home/ubuntu/.nvm/versions/node/v4.6.1/bin'
set :environment, :development
 
# 3時間毎に
every 1.minutes do # 1.minute 1.day 1.week 1.month 1.year is also supported
  command "echo 'hello, whenever world!'"
end

every 1.minutes do # 1.minute 1.day 1.week 1.month 1.year is also supported
  # Rails 内のメソッド実行例
  runner 'Bot.test'
end