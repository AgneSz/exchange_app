class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.references :user, null: false, 
                    foreign_key: true, 
                    index: { name: 'index_accounts_on_user_id' }
      t.references :currency, null: false, 
                    foreign_key: true,
                    index: { name: 'index_accounts_on_currency_id' }
      
      t.timestamps
    end
  end
end
