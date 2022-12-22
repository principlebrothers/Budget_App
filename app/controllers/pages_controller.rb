class PagesController < ApplicationController
  def home
    redirect_to groups_path if user_signed_in?
  end
end
