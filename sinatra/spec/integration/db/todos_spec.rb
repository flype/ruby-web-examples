require 'spec_helper'

module ThingsTodo::DB
  describe Todos do
    describe ".mark_as_done" do
      it "fetches the todo with given id and marks it as done" do
        todo = ThingsTodo::DB::TodoModel.create(:text => 'wadus', :done => false)
        Todos.mark_as_done(todo.id)
        todo.reload.done.should be_true
      end

      it "raises a NotFoundError when there is no todo with given id" do
        expect {
          Todos.mark_as_done('314')
        }.to raise_error(Todos::NotFoundError, 'Todo with id 314 could not be found')
      end
    end
  end
end
