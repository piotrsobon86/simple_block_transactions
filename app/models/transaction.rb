class Transaction < ApplicationRecord
  enum status: { pending: 'pending', error: 'error', executed: 'executed' }
end
