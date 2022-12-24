require 'rails_helper'

RSpec.feature 'Groups', type: :feature do
  before(:all) do
    @user = User.create(name: 'Ernest', email: 'ernestadonu@yahoo.com', confirmed_at: Time.now, password: '@34budget')
  end

  describe 'resource groups' do
    before do
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
      visit groups_path
    end

    scenario 'User see welcome message' do
      expect(page).to have_content("Welcome, #{@user.name}")
    end

    scenario 'User should see a link to create a new group' do
      expect(page).to have_link('Add a new category')
    end
  end
end
