require 'spec_helper'

module ThingsTodo
  describe TodoPresenter do
    let(:todo)  { double(:todo, :id => 314, :text => 'I have to do this!', :done? => false) }
    let(:todo_presenter) { TodoPresenter.new(todo) }

    describe "#id" do
      it "returns todo id" do
        expect(todo_presenter.id).to eq(todo.id)
      end
    end

    describe "#text" do
      it "returns todo text" do
        expect(todo_presenter.text).to eq(todo.text)
      end
    end

    describe "#done?" do
      it "is false when done is false" do
        expect(todo_presenter.done?).to be_false
      end

      it "is true when done is true" do
        todo.stub(:done? => true)
        expect(todo_presenter.done?).to be_true
      end
    end

    describe "#pending?" do
      it "is true when done is false" do
        expect(todo_presenter.pending?).to be_true
      end

      it "is false when done is true" do
        todo.stub(:done? => true)
        expect(todo_presenter.pending?).to be_false
      end
    end

    describe "#caption_classes" do
      it "includes class 'caption'" do
        expect(todo_presenter.caption_classes).to eq('caption')
      end

      it "includes class 'done' when the todo has been done" do
        todo.stub(:done? => true)
        expect(todo_presenter.caption_classes).to eq('caption done')
      end
    end
  end
end
