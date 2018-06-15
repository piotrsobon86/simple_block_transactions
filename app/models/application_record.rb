require 'blockcypher'

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def block_cypher
    token = Rails.application.credentials[:block_cypher_token]
    BlockCypher::Api.new(api_token: token, network: BlockCypher::TEST_NET_3)
  end
end
