class Admin::ApplicationController < ApplicationController

  before_action :authorize_admin!

  def index
  end

  private
  def authorize_admin!
    # Devise method to ensure user is signed in
    authenticate_user!

    unless current_user.admin?
      redirect_to root_path, alert: "You must be an admin to do that."
    end
  end

end
