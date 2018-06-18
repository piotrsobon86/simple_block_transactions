require 'blockcypher'

module Cypher
  class << self
    def api(currency:)
      token = Rails.application.credentials[:block_cypher_token]
      BlockCypher::Api.new(api_token: token, network: network(currency: currency))
    end

    private

    def network(currency:)
      test_net = Rails.application.credentials[:test_net]
      case currency
      when 'btc'
        test_net ? BlockCypher::TEST_NET_3 : BlockCypher::BTC
      else
        raise 'Unknown currency'
      end
    end
  end
end
