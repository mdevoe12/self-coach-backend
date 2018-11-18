class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:login]

  def login
    user = User.find_by(email: login_params[:email])

    if user
      render json: user.id
    else
      render json: {
        status: 500,
        message: 'Username or Password not found.'
      }
    end
  end

  private

  def login_params
    params.permit(:email, :password)
  end

  def hash_password(password)
    BCrypt::Password.create(password).to_s
  end
end
