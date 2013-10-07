require 'spec_helper'

module ThingsTodo
  describe Application do
    include Rack::Test::Methods

    describe "PUT /todos/:id/done" do
      it "marks todo with given id as done" do
        todo_id = '314'
        DB::Todos.should_receive(:mark_as_done).with(todo_id)
        put "/todos/#{todo_id}/done"
        last_response.status.should == 302
        last_response.headers['Location'].should == 'http://example.org/'
      end

      it "responds with 404 if a ThingsTodo::DB::Todos::NotFoundError is raised" do
        todo_id = '314'
        DB::Todos.stub(:mark_as_done).with(todo_id).
          and_raise(ThingsTodo::DB::Todos::NotFoundError)
        put "/todos/#{todo_id}/done"
        last_response.status.should == 404
      end
    end

    def app
      Application
    end
  end
end
