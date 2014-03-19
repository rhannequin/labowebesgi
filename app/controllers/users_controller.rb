class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = User.includes(talks: [:event]).find(params[:id])
  end

end
