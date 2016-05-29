class HomeController < ApplicationController

  def index
    if user_signed_in? && current_user.hr?
      @users = User.all
    end
  end

end
