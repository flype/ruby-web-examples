module ThingsTodo
  module DB
    module Todos
      def self.all
        TodoModel.desc(:created_at).to_a
      end

      def self.add(params)
        TodoModel.create(params)
      end
    end
  end
end
