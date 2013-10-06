require 'spec_helper'

describe "Mark todo as done", :type => :feature do
  it "shows it in the todo list as done" do
    visit '/'

    fill_in 'todo_text', :with => 'Buy Aubergines'
    click_button 'Add'

    fill_in 'todo_text', :with => 'Buy Parmesan'
    click_button 'Add'

    page.should have_css('button', :text => 'Done', :count => 2)

    button = page.all(:css, 'button', :text => 'Done').first
    button.click

    page.should have_css('button', :text => 'Done', :count => 1)
  end
end
