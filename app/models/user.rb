class User < ApplicationRecord
  def balance
    block_cypher.address_balance(bitcoin_address)['balance']
  end

  def final_balance
    block_cypher.address_balance(bitcoin_address)['final_balance']
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
