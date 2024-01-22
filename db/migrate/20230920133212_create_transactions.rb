class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.integer :public_transaction_id
      t.references :account, null: false, 
                    foreign_key: true,
                    index: { name: 'index_transactions_on_accounts_id' }
      t.integer :amount
      t.string :status
      t.references :settlement, null: false, 
                    foreign_key: true,
                    index: { name: 'index_transactions_on_settlement_id' }
      t.timestamps
    end
  end
end
