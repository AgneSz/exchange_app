class CreateSettlements < ActiveRecord::Migration[7.0]
  def change
    create_table :settlements do |t|
      t.references :account, null: false, 
                    foreign_key: true,
                    index: { name: 'index_settlementss_on_account_id' }
      t.integer :balance

      t.timestamps
    end
  end
end
