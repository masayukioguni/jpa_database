
RAILS_ROOT = File.expand_path('../../', File.dirname(__FILE__))
working_directory RAILS_ROOT

# workers
worker_processes 3


listen File.join(RAILS_ROOT, "tmp/pids/unicorn.sock"), :backlog => 64
listen 3000
timeout 30

pid File.join(RAILS_ROOT, "tmp/pids/unicorn.pid")

stderr_path File.join(RAILS_ROOT, "log/unicorn.stderr.log")
stdout_path File.join(RAILS_ROOT, "log/unicorn.stdout.log")

preload_app true
GC.respond_to?(:copy_on_write_friendly=) &&
  GC.copy_on_write_friendly = true
check_client_connection false

before_fork do |server, _worker|
  defined?(ActiveRecord::Base) &&
    ActiveRecord::Base.connection.disconnect!

  # Before forking, kill the master process that belongs to the .oldbin PID.
  # This enables 0 downtime deploys.
  old_pid = "#{server.config[:pid]}.oldbin"
  if File.exist?(old_pid) && server.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # someone else did our job for us
    end
  end
end

after_fork do |_server, _worker|
  defined?(ActiveRecord::Base) &&
    ActiveRecord::Base.establish_connection
end
