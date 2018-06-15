module Transactions
  class Executor
    def initialize(transaction:, password:)
      @transaction = transaction
      @password = password
    end

    def perform
      raise "This transaction is already executed" if @transaction.status == 'executed'
      begin
        secret = SecretPicker.new(@password).pick
        txskel = block_cypher.transaction_new([@transaction.from_address], [@transaction.to_user_address], @transaction.amount)
        response = block_cypher.transaction_sign_and_send(txskel, secret)
        @transaction.update status: :executed, response: response
      rescue  Exception => e
        puts e
        #TODO: send error
        @transaction.update status: :error
      end
    end

    private

    def block_cypher
      token = Rails.application.credentials[:block_cypher_token]
      BlockCypher::Api.new(api_token: token, network: BlockCypher::TEST_NET_3)
    end
  end
end
