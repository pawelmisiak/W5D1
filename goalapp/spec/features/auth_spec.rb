require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  before :each do
    visit new_user_url
  end
  
  scenario 'has a new user page' do
    expect(page).to have_content('Sign Up')
    expect(page).to have_content('Username')
    expect(page).to have_content('Password')
    
  end
end
  feature 'signing up a user' do
    before(:each) do
      # debugger
      visit new_user_url
      fill_in 'username', with: 'testing_username'
      fill_in 'password', with: 'biscuits'
      click_on 'Sign Up'
    end
    scenario 'shows username on the homepage after signup' do
    
    expect(page).to have_content('Sign Out')
    expect(page).to have_content('testing_username')
  end
end
# 
# feature 'logging in' do
#   scenario 'shows username on the homepage after login'
# 
# end
# 
# feature 'logging out' do
#   scenario 'begins with a logged out state'
# 
#   scenario 'doesn\'t show username on the homepage after logout'
# 
# end