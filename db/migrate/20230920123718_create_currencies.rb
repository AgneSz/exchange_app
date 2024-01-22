class CreateCurrencies < ActiveRecord::Migration[7.0]
  def change
    create_table :currencies do |t|
      t.string :iso_code
      t.string :name

      t.timestamps
    end
  end
end
