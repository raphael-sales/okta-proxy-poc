require 'uri'
require 'net/http'

class OktaController < ApplicationController
    def index
        token = params[:token]

        uri = URI('https://vinted.oktapreview.com/oauth2/aus3wxndj4y6CeZsC0x7/v1/userinfo')

        req = Net::HTTP::Get.new(uri)
        req['Authorization'] = "Bearer #{token}!"

        res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') { |http|
            http.request(req)
        }

        begin
            result = JSON.parse res.body
            render json: { data: result }, status: :ok
        rescue
            render json: { error: 'invalid token' }, status: :forbidden
        end
    end
end
  