class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:login]


  def login
    pry
  end
end
