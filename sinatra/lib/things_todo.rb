module ThingsTodo
  def self.root
    File.join(File.dirname(__FILE__), '..')
  end

  def self.app_env
    ENV['RACK_ENV']
  end
end

require 'things_todo/url_helpers'
require 'things_todo/application'
require 'things_todo/todo_presenter'
require 'things_todo/db/todos'
require 'things_todo/db/todo_model'
