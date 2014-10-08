module DaFace
  module Api
    module Adapters
      class ExconAdapter < DaFace::Api::Adapters::Base
        def connection
          Excon.new self.api_path
        end

        def get path, params={}
          response = connection.get :path => "#{path}#{url_params(params)}", :headers => get_headers
          return parse_body(response.body)
        end

        def post path, payload
          response = connection.post :path => path, :body => encode_form(payload), :headers => post_headers
          return {} if response.body.empty?
          return parse_body(response.body)
        end
        
        def put path, payload
          response = connection.put :path => "#{path}", :body => encode_form(payload), :headers => post_headers
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
