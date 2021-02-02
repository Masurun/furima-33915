class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string      :name,               null: false
      t.text        :description,        null: false
      t.integer     :category_id,        null: false
      t.integer     :status_id,          null: false
      t.integer     :deliver_burden_id,  null: false
      t.integer     :pref_id,            null: false
      t.integer     :deliver_date_id,   null: false
      t.integer     :sell_price,         null: false
      t.references  :user,               foreign_key: true
      t.timestamps
    end
  end
end
