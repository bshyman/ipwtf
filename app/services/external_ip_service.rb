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
end