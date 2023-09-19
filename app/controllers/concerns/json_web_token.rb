require "jwt"

module JsonWebToken
  extend ActiveSupport::Concern
  SECRET_KEY = Rails.application.secret_key_base.to_s

  def jwt_encode(payload, expire = 7.days.from_now)
    payload[:expire] = expire.to_i
    JWT::encode(payload, SECRET_KEY)
  end

  def jwt_decode(payload)
    decoded = JWT::decode(payload, SECRET_KEY).first
    HashWithIndifferentAccess.new decoded
  end
end
