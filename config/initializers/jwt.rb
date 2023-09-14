# config/initializers/jwt.rb

HMAC_SECRET = Rails.application.secrets.secret_key_base

def encode_token(payload)
  JWT.encode(payload, HMAC_SECRET)
end

def decode_token(token)
  JWT.decode(token, HMAC_SECRET, true, algorithm: 'HS256')
end
