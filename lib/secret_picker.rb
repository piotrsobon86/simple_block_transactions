class SecretPicker
  IV = Rails.application.credentials[:bitcoin_secret_iv].freeze

  def initialize(password)
    @password = password
  end

  def pick
    secret = encoded_secret
    decode(secret)
  end

  private

  def encoded_secret
    path = Rails.root.join('config', 'encoded_secret.key')
    file = File.new(path, 'r')
    file.gets
  end

  def decode(secret)
    c = OpenSSL::Cipher.new('aes-256-cbc').decrypt
    c.iv = IV
    c.key = Digest::SHA256.digest(@password)
    c.update(encoded_secret) + c.final
  end
end