class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: [:create]

  def create
    @user = User.new(user_params)
    if @user.save
      #TO-DO: figure out best practices for authentication after creation
      command = AuthenticateUser.call(@user.email, @user.password)
 
      if command.success?
        render json: { user: @user, auth: { auth_token: command.result } }
      else
        render json: { error: command.errors }, status: :unauthorized
      end
    else
      # TO-DO: return more informative error
      render status: :bad_request
    end
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email, :password)
  end
end
