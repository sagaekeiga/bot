worker_processes 2
working_directory "/home/anime/bot/current"

listen "/var/run/unicorn/unicorn_bot.sock"
pid "/var/run/unicorn/unicorn_bot.pid"

preload_app true