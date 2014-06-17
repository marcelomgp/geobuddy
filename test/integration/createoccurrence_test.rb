require 'test_helper'

class CreateoccurrenceTest < ActionDispatch::IntegrationTest

  test "Creating new occurrence with valid params" do
    visit '/occurrences/new'
    fill_in 'Description', with: 'Testing valid params'
    click_button 'Create'
    expect(page).to have_content 'Success'
    response.should render_template("home") 
  end

  #scenario "Creating new occurrence with invalid params - no Description" do
  #  visit '/'
  #  click_map
  #  click_link 'New Occurrence'
  #  select_option 'Occurence type', with: => 'Accident'
  #  click_button 'Create'
  #  expect(page).to have_content 'Error'
  #end

  #scenario "Creating new occurrence with invalid params - no Occurrence type" do
  #  visit '/'
  #  click_map
  #  click_link 'New Occurrence'
  #  fill_in 'Description', with: => 'Testing invalid params'
  #  click_button 'Create'
  #  expect(page).to have_content 'Error'
  #end

end
