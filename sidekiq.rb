require 'sidekiq'
require 'sidekiq-cron'
ENV['APP_ENV'] ||= 'development'
ENV['MONGOID_ENV'] ||= ENV['APP_ENV']
require 'mongoid'
require 'redis'
require 'yaml'
Dir[File.expand_path('./lib/**/*.rb', File.dirname(__FILE__))].sort.each {|file| require file }
Dir[File.expand_path('./models/**/*.rb', File.dirname(__FILE__))].each {|file| require file }
Dir[File.expand_path('./config/initializers/**/*.rb', File.dirname(__FILE__))].each {|file| require file }
Mongoid.load!(File.expand_path('./config/mongoid.yml', File.dirname(__FILE__)))

Sidekiq.configure_server do |config|
  config.redis = YAML.load_file(File.expand_path('./config/redis.yml', File.dirname(__FILE__)))[ENV['APP_ENV']]
end

schedule_file = File.expand_path('./config/schedule.yml', File.dirname(__FILE__))

if File.exists?(schedule_file) && Sidekiq.server?
  Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
end

Dir[File.expand_path('./workers/**/*.rb', File.dirname(__FILE__))].each {|file| require file }
