class UsersController < ApplicationController

  def edit
  end

 def show
  user = User.find(params[:id])
  @prototypes = user.prototypes
  @name = user.name
  @profile = user.profile
  @occupation = user.occupation
  @position = user.position
 end

  private

  def user_params
    params.require(:user).parmit(:name, :email)
  end

end
