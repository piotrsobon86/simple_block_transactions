module Transactions
  class Creator
    def initialize(user:, currency:, amount:)
      @user = user
      @currency = currency
      @amount = amount
    end

    def perform
      user_address = @user.address_by_currency(@currency)
      Transaction.create!(amount: @amount, to_user_id: @user.id, to_user_address: user_address,
                          from_address: source_address, currency: @currency)
    end

    private

    def source_address
      case @currency
      when 'btc'
        Rails.application.credentials[:bitcoin_source_address]
      else
        raise 'Unknown currency'
      end
    end
  end
end
