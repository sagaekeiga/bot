worker_processes 2
working_directory "/home/anime/bot/current"

listen "/var/run/unicorn/unicorn.sock"
pid "/var/run/unicorn/unicorn.pid"

preload_app true