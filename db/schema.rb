# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_10_11_211458) do

  create_table "hosts", force: :cascade do |t|
    t.integer "scan_id"
    t.string "status"
    t.string "reason"
    t.binary "ip4_addr"
    t.binary "os"
    t.binary "hostnames"
    t.integer "times_srtt"
    t.integer "times_rttvar"
    t.integer "times_to"
    t.integer "starttime"
    t.integer "endtime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["scan_id"], name: "index_hosts_on_scan_id"
  end

  create_table "ports", force: :cascade do |t|
    t.integer "host_id"
    t.integer "scan_id"
    t.string "proto"
    t.integer "num"
    t.string "state"
    t.string "reason"
    t.integer "reason_ttl"
    t.string "reason_ip"
    t.string "service_name"
    t.string "service_method"
    t.integer "service_conf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["host_id"], name: "index_ports_on_host_id"
    t.index ["scan_id"], name: "index_ports_on_scan_id"
  end

  create_table "scans", force: :cascade do |t|
    t.string "scan_args"
    t.string "nmap_version"
    t.float "xml_version"
    t.integer "start_time"
    t.integer "stop_time"
    t.string "exit"
    t.string "errormsg"
    t.integer "verbose"
    t.integer "debug"
    t.integer "host_up"
    t.integer "hosts_down"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
