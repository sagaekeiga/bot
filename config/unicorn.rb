worker_processes 2
working_directory "/home/anime/bot/current"

listen "/var/run/tmp/unicorn.sock"
pid "/var/run/tmp/unicorn.pid"

preload_app true