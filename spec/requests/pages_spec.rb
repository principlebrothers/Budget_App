require 'rails_helper'

RSpec.describe "Pages", type: :request do
  describe "GET /home" do
    it "returns http success" do
      get root_path
      expect(response).to have_http_status(:success)
    end

    it "should have the right title" do
      get root_path
      expect(response.body).to include("BudgetBuddy")
    end

    it 'should have a link to sign up' do
      get root_path
      expect(response.body).to include("Sign up")
    end

    it 'should have a link to Log in' do
      get root_path
      expect(response.body).to include("Log in")
    end
  end

end
