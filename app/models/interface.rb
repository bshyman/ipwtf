class Interface < ApplicationRecord
  belongs_to :user
  attr_accessor :hostname

  validates_format_of :ip, with: /(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])/,
                      message:   ' is invalid'
  validates_format_of :ddns, with: /^(([a-zA-Z0-9]|[a-zA-Z0-9][a-zA-Z0-9\-]*[a-zA-Z0-9])\.)*([A-Za-z0-9]|[A-Za-z0-9][A-Za-z0-9\-]*[A-Za-z0-9])$/,
                      message:     'address is invalid', multiline: true, allow_blank: true
end
