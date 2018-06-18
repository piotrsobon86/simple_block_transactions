class User < ApplicationRecord
  def balance(currency:)
    Cypher.api(currency: currency).address_balance(bitcoin_address)['balance']
  end

  def final_balance(currency:)
    Cypher.api(currency: currency).address_balance(bitcoin_address)['final_balance']
  end

  def address_by_currency(currency)
    case currency
    when 'btc'
      bitcoin_address
    else
      raise 'Unknown currency'
    end
  end
end
