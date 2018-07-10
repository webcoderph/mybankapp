class AddTransactionNoToAccountTransactions < ActiveRecord::Migration[5.1]
  def change
    add_column :account_transactions, :transaction_no, :string
  end
end
