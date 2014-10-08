# Internals dependencies
require "da_face/version"
require "da_face/configuration"
require "da_face/utilities"
require "da_face/errors"
require "da_face/api/adapter"
require "da_face/api/adapters/base"
require "da_face/api/adapters/excon_adapter"
require "da_face/api/adapters/em_http_request_adapter"
require "da_face/api/push"
require "da_face/api/push_log"
require "da_face/api/push_log_entry"
require "da_face/api/push_subscription"
require "da_face/datasift/parser"
require "da_face/datasift/errors"
require "da_face/datasift/da_object"
require "da_face/datasift/interaction"
require "da_face/datasift/links"
require "da_face/datasift/link"
require "da_face/datasift/demographic"
require "da_face/datasift/language"
require "da_face/datasift/salience"
require "da_face/datasift/twitter"
require "da_face/twitter/parser"
require "da_face/twitter/tweet"
require "da_face/twitter/user"

# External dependencies
require "json"
require "excon"

module DaFace
  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
    self.configuration
  end

  def self.reset_config
    @configuration = Configuration.new
  end
end
