class JwtService
  SECRETE_SALT = Rails.application.credentials.secret_key_base

  def self.encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i

    JWT.encode(payload, SECRETE_SALT)
  end

  def self.decode
  end

end
