module Intelipost
  class Facade
    include ::HTTParty
    base_uri 'https://api.intelipost.com.br/api'
    format :json
    default_timeout 15

    class << self
      def get_with_log(url, api_key, params={})
        call_intelipost(api_key, :get, url, params)
      end

      def post_with_log(url, api_key, params={})
        call_intelipost(api_key, :post, url, params)
      end

      private
      def call_intelipost(api_key, action, url, params)
        $logger.info ("[info] calling intelipost with ".yellow + "#{action.to_s.upcase}".white.on_blue + ": #{url},".white + " #{params.to_s}".green)
        begin
          response = self.send(action, url, params_with_apikey(params, api_key))
        rescue SocketError
          response = Intelipost::Models::ErrorResponse.new({status: "ERROR", messages: [{"type" => "ERROR", "text" => "Connection Timeout", "key" => "timeout"}]})
        end
        $logger.info ("[info] intelipost response from call ".yellow + "#{action.to_s.upcase}".white.on_blue + " " + "#{url}, ".white + " #{response.to_s}".blue)

        response
      end

      private
      def params_with_apikey(params, api_key)
        params.merge({
          :headers => {
            "api_key" => api_key,
            "Content-Type" => "application/json"
          }
        })
      end
    end
  end
end
