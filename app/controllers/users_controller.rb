class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:login]

  def login
    result = User.login(login_params)
    if result
      render json: {
        status: 200,
        message: 'User successfully logged in.'
      }
    else
      render 500
    end
  end

  private

  def login_params
    params.permit(:email, :password)
  end
end
