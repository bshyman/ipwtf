require "net/http"
require 'net/ping'

class ExternalIPService
  # include Net/

  def get_external_ip
    p 'GET IP CALL'
    Net::HTTP.get(URI("https://api.ipify.org"))
  end

  def check_for_life(interface)
    if interface.scope === 'public'
      if interface.port
      else
      end
      check = Net::Ping::External.new(interface.ip)
    else
      if interface.port
        check = Net::Ping::TCP.new(interface.ip, interface.port)
      else
        check = Net::Ping::External.new(interface.ip)
      end
    end
    p 'PING#' + check.ping?.to_s

    pingable = check.ping?
    update_interface(interface, pingable)
    pingable
  end

  def refresh_all_on_login
    Interface.all.each do |interface|
      update_interface(interface)
    end
  end

  def update_interface(interface, pulse)
    if pulse
      interface.update!(last_response: pulse, last_responded_at: Time.current)
    else
      interface.update!(last_response: nil)
    end
  end
end