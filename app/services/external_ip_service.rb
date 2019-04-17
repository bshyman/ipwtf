require "net/http"
require 'net/ping'

class ExternalIPService

  def get_external_ip
    p 'GET IP CALL'
    Net::HTTP.get(URI("https://api.ipify.org"))
  end

  def check_for_life(interface)
    check = Net::Ping::External.new(interface.ip)
    p 'PING#' + check.ping?.to_s
    check.ping?
  end

  def refresh_all_on_login
    Interface.all.each do |interface|
      update_interface(interface)
    end
  end

  def update_interface(interface)
    pulse = check_for_life(interface)
    if pulse
      interface.update!(last_response: pulse, last_responded_at: Time.current)
    else
      interface.update!(last_response: nil)
    end
  end
end