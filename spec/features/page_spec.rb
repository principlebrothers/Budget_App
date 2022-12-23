require 'rails_helper'

RSpec.feature "Pages", type: :feature do
  scenario "User visits the home page" do
    visit root_path
    expect(page).to have_content('BudgetBuddy')
  end

  scenario 'User should links to sign up or log in page' do
    visit root_path
    expect(page).to have_link("Sign up")
    expect(page).to have_link("Log in")
  end
end
