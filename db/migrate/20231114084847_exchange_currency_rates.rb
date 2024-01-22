class ExchangeCurrencyRates < ActiveRecord::Migration[7.0]
  def change
    create_table :exchange_currency_rates do |t|
      t.string :currency_to, null: false
      t.string :currency_from, null: false
      t.integer :exchange_rate

      t.timestamps
    end
  end
end
