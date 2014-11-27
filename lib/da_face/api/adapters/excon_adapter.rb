module DaFace
  module Api
    module Adapters
      class ExconAdapter < DaFace::Api::Adapters::Base
        def connection
          Excon.new self.api_path
        end

        def get path, params={}
          response = connection.get :path => "#{path}#{url_params(params)}", :headers => get_headers
          handle_response(response)
        end

        def post path, payload
          response = connection.post :path => path, :body => encode_form(payload), :headers => post_headers
          handle_response(response)
        end
        
        def put path, payload
          response = connection.put :path => "#{path}", :body => encode_form(payload), :headers => post_headers
          handle_response(response)
        end

        def parse_body body
          if body.empty?
            {}
          else
            JSON.parse(body)
          end
        end

        def handle_response response
          rate_limit_info = extract_rate_limit_info(response)
          set_rate_limit_status(rate_limit_info[:limit], rate_limit_info[:remaining])
          return parse_body(response.body)
        end

        def extract_rate_limit_info response
          {
            :limit => response.headers['x-ratelimit-limit'],
            :remaining => response.headers['x-ratelimit-remaining']
          }
        end
      end
    end
  end
end
