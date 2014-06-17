require 'test_helper'

class CreateoccurrenceTest < ActionDispatch::IntegrationTest

  test "Creating new occurrence with valid params" do
    visit '/occurrences/new?lat=-22.893413507746303&lng=-43.29265594482422'
    #select_option 'Occurence type', with: 'Accident'
    fill_in 'Description:', with: 'Testing valid params'
    click_button 'Create'
  #  expect(page).to have_content 'Success'
    assert_equal current_path, '/' 
  end

  test "Creating new occurrence with invalid params - no Description" do
    visit '/occurrences/new?lat=-22.89112046369391&lng=-43.271026611328125'
    click_button 'Create'

    assert_equal current_path, '/occurrences'
    assert page.has_text?("Description can't be blank")
  end

  #scenario "Creating new occurrence with invalid params - no Occurrence type" do
  #  visit '/'
  #  click_map
  #  click_link 'New Occurrence'
  #  fill_in 'Description', with: => 'Testing invalid params'
  #  click_button 'Create'
  #  expect(page).to have_content 'Error'
  #end

end
