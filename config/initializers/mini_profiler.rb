if Rails.env == 'development'
  require 'rack-mini-profiler'
  p "#######################################################"

  # initialization is skipped so trigger it
  Rack::MiniProfilerRails.initialize!(Rails.application)
end