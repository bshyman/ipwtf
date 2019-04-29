class Interface < ApplicationRecord
  belongs_to :user
  has_many :notes
  attr_accessor :hostname

  validates_format_of :ip, with: /(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])/,
                      message:   ' needs to be in valid IP format'
  validates_format_of :ddns, with: /^(([a-zA-Z0-9]|[a-zA-Z0-9][a-zA-Z0-9\-]*[a-zA-Z0-9])\.)*([A-Za-z0-9]|[A-Za-z0-9][A-Za-z0-9\-]*[A-Za-z0-9])$/,
                      message:     'address is invalid', multiline: true, allow_blank: true

  def alive?
    service = ExternalIPService.new
    service.check_for_life(ip)
  end

  def ui_life_status
    last_response.present? ? 'Active' : 'Dead'
  end

   def ip_port
    port ? self.ip + ':' + self.port.to_s : self.ip
  end
end
