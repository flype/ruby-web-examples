$: << File.join(File.dirname(__FILE__), 'lib')
ENV['RACK_ENV'] ||= 'development'

require 'things_todo'

mongoid_config_path = File.join(ThingsTodo.root, 'config', 'mongoid.yml')
Mongoid.load!(mongoid_config_path, ThingsTodo.app_env)
