require 'yaml'

config_redis =  YAML.load_file(File.expand_path('./../redis.yml', File.dirname(__FILE__)))[ENV["APP_ENV"]]
$redis = Redis.new(:host => config_redis["host"], :port => config_redis["port"], :db => config_redis["db"], :thread_safe=>true)
