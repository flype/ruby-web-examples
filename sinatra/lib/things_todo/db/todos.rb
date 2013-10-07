module ThingsTodo
  module DB
    module Todos
      class NotFoundError < StandardError; end

      def self.all
        TodoModel.desc(:created_at).to_a
      end

      def self.add(params)
        TodoModel.create(params)
      end

      def self.mark_as_done(id)
        todo = TodoModel.where(:id => id).first
        raise_not_found(id) unless todo
        todo.update_attribute(:done, true)
      end

      private

      def self.raise_not_found(id)
        raise NotFoundError.new("Todo with id #{id} could not be found")
      end
    end
  end
end
