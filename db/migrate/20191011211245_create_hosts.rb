class CreateHosts < ActiveRecord::Migration[5.2]
  def change
    create_table :hosts do |t|
      # t.integer :scan_id
      t.references :scan, index: true, foreign_key: true
      t.string :status
      t.string :reason
      t.binary :ip4_addr
      t.binary :os
      t.binary :hostnames
      t.integer :times_srtt
      t.integer :times_rttvar
      t.integer :times_to
      t.integer :starttime
      t.integer :endtime

      t.timestamps
    end
  end
end
