require 'nmap/parser'

class Import::ImportXml < ApplicationService
  def initialize(file)
    @file = file
    @data = Nmap::Parser.parsefile(@file)
  end

  def call
    hydrate_scan
    return {success: true, scan: @scan}
  end

  private
  def hydrate_scan
    s = @data.session
    attrs = {
      scan_args: s.scan_args,
      nmap_version: s.nmap_version,
      xml_version: s.xml_version,
      start_time: s.start_time,
      stop_time: s.stop_time,
      exit: s.exit,
      errormsg: s.errormsg,
      verbose: s.verbose,
      debug: s.debug,
      hosts_up: s.numhosts("up"),
      hosts_down: s.numhosts("down")
    }
    @scan = Scan.create(attrs)
    hydrate_hosts
  end

  def hydrate_hosts
    @data.hosts.map{|host|
      model = @scan.hosts.create(
        status: host.status,
        reason: host.reason,
        os: host.os.to_json,
        ip4_addr: host.ip4_addr,
        hostnames: host.hostnames(),
        times_srtt: host.times.srtt,
        times_rttvar: host.times.rttvar,
        times_to: host.times.to,
        starttime: host.starttime,
        endtime: host.endtime
      )
      hydrate_ports(host, model)
    }
  end

  def hydrate_ports(host, model)
    ports = host.getports(:any).map{|port|
      {
        proto: port.proto,
        num: port.num,
        state: port.state,
        reason: port.reason,
        reason_ttl: port.reason_ttl,
        reason_ip: port.reason_ip,
        service_name: port.service.name,
        service_method: port.service.method,
        service_conf: port.service.confidence
      }
    }
    model.ports.create(ports)
  end

end