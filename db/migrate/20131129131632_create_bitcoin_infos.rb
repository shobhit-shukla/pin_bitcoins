class CreateBitcoinInfos < ActiveRecord::Migration
  def change
    create_table :bitcoin_infos do |t|
      t.string :pub_key
      t.string :priv_key
      t.string :bit_address
      t.string :user_id

      t.timestamps
    end
  end
end
