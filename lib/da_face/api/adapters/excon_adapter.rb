module DaFace
  module Api
    module Adapters
      class ExconAdapter < DaFace::Api::Adapters::Base
        def connection
          Excon.new self.api_path, :headers => self.default_headers
        end

        def get path, params={}
          response = connection.get :path => "#{path}#{url_params(params)}"
          return parse_body(response.body)
        end

        def post path, payload
          response = connection.post :path => path, :body => payload.to_json
          return {} if response.body.empty?
          return parse_body(response.body)
        end
        
        def put path, payload
          response = connection.put :path => "#{path}", :body => payload.to_json
          return {} if response.body.empty?
          return parse_body(response.body)
        end

        def parse_body body
          JSON.parse(body)
        end
        
      end
    end
  end
end
