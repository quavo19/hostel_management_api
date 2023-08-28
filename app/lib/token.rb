# app/lib/token.rb

module Token
    HMAC_SECRET = Rails.application.secrets.secret_key_base
  
    def self.encode(payload)
      JWT.encode(payload, HMAC_SECRET, 'HS256')
    end
  
    def self.decode(token)
      JWT.decode(token, HMAC_SECRET, true, algorithm: 'HS256')
    end
  end
  