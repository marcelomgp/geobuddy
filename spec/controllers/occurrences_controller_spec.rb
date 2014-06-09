require 'rails_helper'

#RSpec.describe OccurrencesController, :type => :controller do

feature "Navigation through forms"

  scenario "Accessing new occurrence path" do
    visit '/'
    click_map
    click_link 'New Occurrence'
    expect(page).to have_content 'Welcome to Police Occurrence Form'
  end

  scenario "Accessing new occurrence path" do
    visit '/'
    click_map
    click_link 'New Occurrence'
    click_link 'Back to map'
    response.should render_template("home")
  end

end

feature "Creating new Occurrence" do

  scenario "Creating new occurrence path with valid params" do
    visit '/'
    click_map
    click_link 'New Occurrence'
    select_option 'Occurence type', with: => 'Accident'
    fill_in 'Description', with: => 'Testing valid params'
    click_button 'Create'
    expect(page).to have_content 'Success'
    response.should render_template("home")
  end

  scenario "Creating new occurrence path with invalid params - no Description" do
    visit '/'
    click_map
    click_link 'New Occurrence'
    select_option 'Occurence type', with: => 'Accident'
    click_button 'Create'
    expect(page).to have_content 'Error'
  end

  scenario "Creating new occurrence path with invalid params - no Occurrence type" do
    visit '/'
    click_map
    click_link 'New Occurrence'
    fill_in 'Description', with: => 'Testing invalid params'
    click_button 'Create'
    expect(page).to have_content 'Error'
  end

end
