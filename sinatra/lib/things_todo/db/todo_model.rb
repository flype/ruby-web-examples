require 'mongoid'

module ThingsTodo
  module DB
    class TodoModel
      include Mongoid::Document
      include Mongoid::Timestamps::Created

      field :text, :type => String
      field :done, :type => Boolean, :default => false
    end
  end
end
