class UsersController < ApplicationController
  before_action :find_user

  def show
  end

  def update
  end

  private

  def find_user
    @user = User.find(params[:id])
  end
end
