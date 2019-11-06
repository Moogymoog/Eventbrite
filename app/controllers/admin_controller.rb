class AdminController < ApplicationController
  before_action :check_if_admin

  # Methods omitted

  def check_if_admin
    unless current_user.is_admin?
      redirect_to root_path
    end
  end
end
