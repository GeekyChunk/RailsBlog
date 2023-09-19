class ApplicationController < ActionController::API
  include JsonWebToken

  def authorize
    header = request.headers['Authorization']
    header = header.split(' ').last if header

    begin
      @decoded = jwt_decode(header)
      @current = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound
      render json: { errors: '' }, status: :unauthorized
    rescue JWT::DecodeError
      render json: { errors: '' }, status: :unauthorized
    end
  end
end
