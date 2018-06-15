class User < ApplicationRecord
  def balance
    block_cypher.address_balance(bitcoin_address)['balance']
  end

  def final_balance
    block_cypher.address_balance(bitcoin_address)['final_balance']
  end

  def send_coins(amount:, password:)
    source_address = Rails.application.credentials[:bitcoin_source_address]
    secret = SecretPicker.new(password).pick
    txskel = block_cypher.transaction_new([source_address], [bitcoin_address], amount)
    block_cypher.transaction_sign_and_send(txskel, secret)
  end
end
