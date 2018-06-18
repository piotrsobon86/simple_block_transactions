module Transactions
  class Executor
    def initialize(transaction:, password:)
      @transaction = transaction
      @password = password
    end

    def perform
      raise 'This transaction is already executed' if @transaction.executed?
      begin
        secret = PrivateKeyPicker.new(@password).pick
        api = Cypher.api(currency: @transaction.currency)
        txskel = api.transaction_new([@transaction.from_address], [@transaction.to_user_address], @transaction.amount)
        response = api.transaction_sign_and_send(txskel, secret)
        @transaction.update status: :executed, response: response
      rescue  Exception => e
        @transaction.update status: :error
        raise e
      end
    end
  end
end
