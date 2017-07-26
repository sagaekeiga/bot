worker_processes 2
working_directory "/home/solacom_test/work/terror/current"

listen "/var/run/unicorn/terror.sock"
pid "/var/run/unicorn/terror.pid"


stderr_path "/home/solacom_test/work/terror/current/log/unicorn.log"
stdout_path "/home/solacom_test/work/terror/current/log/unicorn.log"


preload_app true