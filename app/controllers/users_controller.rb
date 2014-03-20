class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = User.includes(:talks: [:event]).friendly.find(params[:id])
    raise ActionController::RoutingError.new('Not Found') if @user.nil?
    if request.path != user_path(@user)
      redirect_to @user, status: :moved_permanently
    end
  end

end
