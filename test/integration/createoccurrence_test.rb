require 'test_helper'

class CreateoccurrenceTest < ActionDispatch::IntegrationTest

  test "with valid data" do
    visit 'occurrences/new?lat=-22.893413507746303&lng=-43.29265594482422'

    #select 'Accident', from: 'Occurrence type:'
    fill_in 'Description:', with: 'Testing valid params'
    click_button 'Create'

    assert page.has_text?('Success')
    assert_equal current_path, '/' 
  end

  test "back to map" do
    visit 'occurrences/new?lat=-22.893413507746303&lng=-43.29265594482422'

    click_link 'Back to map'

    assert_equal current_path, '/' 
  end

  test "with invalid data: Description" do
    visit 'occurrences/new?lat=-22.89112046369391&lng=-43.271026611328125'

    click_button 'Create'

    assert page.has_text?("Check your form before continue")
    assert_equal current_path, '/occurrences'
  end

end
