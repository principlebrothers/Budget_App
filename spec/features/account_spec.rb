require 'rails_helper'

RSpec.feature 'Accounts', type: :feature do
  before(:all) do
    @user = User.create(name: 'Ernest', email: 'ernestadonu@yahoo.com', confirmed_at: Time.now, password: '@34budget')
    @group = Group.create(name: 'Food', author_id: @user.id, icon: 'https://image.flaticon.com/icons/svg/149/149071.svg')
  end

  describe 'resource group_accounts' do
    before do
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
      visit groups_path
      click_link @group.name.to_s
    end

    scenario 'User should see a link to create a new account' do
      expect(page).to have_link('Add a new transaction')
    end

    scenario 'User should see a link logout ' do
      expect(page).to have_link('Logout')
    end
  end
end
