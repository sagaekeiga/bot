worker_processes 2
working_directory "/home/anime/deploy/s_press"

litsen "/var/run/unicorn/unicorn.sock"
pid "/var/run/unicorn/unicorn.pid"

preload_app true