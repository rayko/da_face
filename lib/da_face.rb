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
require "da_face/datasift/twitter_delete_notification"
require "da_face/datasift/twitter_user_status"
require "da_face/twitter/parser"
require "da_face/twitter/tweet"
require "da_face/twitter/user"

# External dependencies
require "json"
require "excon"
require "yajl"

module DaFace
  class << self
    attr_accessor :configuration

    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
      self.configuration
    end

    def reset_config
      @configuration = Configuration.new
    end

    def create_subscription data={}
      DaFace::Api::PushSubscription.new data
    end

    def parse_datasift_collection data
      DaFace::Datasift::Parser.new.parse_collection(data)
    end

    def parse_datasift_object data
      DaFace::Datasift::Parser.new.parse_from_json(data)
    end
    
    def get_subscriptions
      DaFace::Api::PushSubscription.get_all
    end

  end

end
