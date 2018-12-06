class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:login]

  def login
    user = User.find_by(email: login_params[:email])
    user.authenticate(login_params[:password])
    render json: user.id

    rescue StandardError
      render json: {
        status: 500,
        message: 'Username or Password not found.'
      }
  end

  private

  def login_params
    params.permit(:email, :password)
  end
end
