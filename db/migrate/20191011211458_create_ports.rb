class CreatePorts < ActiveRecord::Migration[5.2]
  def change
    create_table :ports do |t|
      t.references :host, index: true, foreign_key: true
      t.references :scan, index: true, foreign_key: true
      # t.integer :host_id
      # t.integer :scan_id
      t.string :type
      t.integer :num
      t.string :state
      t.string :reason
      t.integer :reason_ttl
      t.string :reason_ip
      t.string :service_name
      t.string :service_method
      t.integer :sercie_conf

      t.timestamps
    end
  end
end
