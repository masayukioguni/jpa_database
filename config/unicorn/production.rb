RAILS_ROOT = File.expand_path('../../', File.dirname(__FILE__))
working_directory RAILS_ROOT

listen File.join(RAILS_ROOT, "tmp/pids/unicorn.sock"), :backlog => 64
listen 12525

timeout 30

pid File.join(RAILS_ROOT, "tmp/pids/unicorn.pid")

stderr_path File.join(RAILS_ROOT, "log/unicorn.stderr.log")
stdout_path File.join(RAILS_ROOT, "log/unicorn.stdout.log")

preload_app true
GC.respond_to?(:copy_on_write_friendly=) and
  GC.copy_on_write_friendly = true
check_client_connection false

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!

  old_pid = "#{server.config[:pid]}.oldbin"
  if old_pid != server.pid
    begin
      sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
      Process.kill(sig, File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end
