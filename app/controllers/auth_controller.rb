class AuthController < ApplicationController
  before_action :authorize, only: [:profile]

  def login
    @user = User.where(username: login_params[:username]).first

    if @user&.authenticate(login_params[:password])
      token = jwt_encode(user_id: @user.id)
      render json: { :token => token }
    else
      render json: { :message => 'wrong_credentials' }, status: 401
    end
  end

  def register
    @user = User.new(login_params)
    if @user.save
      render json: @user
    else
      render json: @user.errors
    end
  end

  def profile
    render json: @current.slice(:id, :role, :username)
  end

  private

  def login_params
    params.permit(:username, :password)
  end

  def register_params
    params.permit(:username, :password)
  end
end
