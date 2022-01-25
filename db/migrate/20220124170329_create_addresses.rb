class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :customer, null: false # 顧客への外部キー
      t.string :type, null: false # 継承カラム
      t.string :company_name, null: false, default: "" # 会社名
      t.string :agreements_ID, null: false # 契約ID
      t.string :customer_code, null: false # 顧客コード
      t.string :instance_name, null: false # インスタンス名
      t.string :VHOST_code, null: false # VHOST番号      

      t.timestamps
    end

    add_index :addresses, [ :type, :customer_id ], unique: true
    add_foreign_key :addresses, :customers
  end
end