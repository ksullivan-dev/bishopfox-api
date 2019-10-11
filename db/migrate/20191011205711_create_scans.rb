class CreateScans < ActiveRecord::Migration[5.2]
  def change
    create_table :scans do |t|
      t.string :scan_args
      t.string :nmap_version
      t.float :xml_version
      t.integer :start_time
      t.integer :stop_time
      t.string :exit
      t.string :errormsg
      t.integer :verbose
      t.integer :debug
      t.integer :host_up
      t.integer :hosts_down

      t.timestamps
    end
  end
end
