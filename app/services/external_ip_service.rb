require "net/http"
class ExternalIPService
  def call
    Net::HTTP.get(URI("https://api.ipify.org"))
  end
end