class UsersController < ApplicationController

  def edit
  end

 def show
  @user = current_user.prototypes
  @prototypes = users.prototype
 end

  private

  def user_params
    params.require(:user).parmit(:name, :email)
  end

end
