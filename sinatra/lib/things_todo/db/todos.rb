module ThingsTodo
  module DB
    module Todos
      def self.all
        TodoModel.desc(:created_at).to_a
      end

      def self.add(params)
        TodoModel.create(params)
      end

      def self.mark_as_done(id)
        todo = TodoModel.where(:id => id).first
        todo.update_attribute(:done, true)
      end
    end
  end
end
