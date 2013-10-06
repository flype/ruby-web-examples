require 'spec_helper'

describe "Adding a todo", :type => :feature do
  it "shows it in the todo list" do
    visit '/'

    fill_in 'todo_text', :with => 'Buy Aubergines'
    click_button 'Add'

    page.should have_content 'Buy Aubergines'
  end
end
