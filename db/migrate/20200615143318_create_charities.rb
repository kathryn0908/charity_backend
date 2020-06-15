class CreateCharities < ActiveRecord::Migration[6.0]
  def change
    create_table :charities do |t|
      t.string "charity_name"
      t.string "url"
      t.string "donation_url"
      t.string "city"
      t.string "state"
      t.string "category"

      t.timestamps
    end
  end
end
