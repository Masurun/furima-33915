class CreateBuyerHomes < ActiveRecord::Migration[6.0]
  def change
    create_table :buyer_homes do |t|
      t.string     :post_num,    null: false
      t.integer    :pref_id,     null: false
      t.string     :city,        null: false
      t.string     :street,      null: false
      t.string     :building
      t.string     :phone_num,   null: false
      t.references :buy_mane,    null: false 
      t.timestamps
    end
  end
end
