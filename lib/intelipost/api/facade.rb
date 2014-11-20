module Intelipost
  class Facade
    include ::HTTParty
    base_uri 'https://api.intelipost.com.br/api'
    format :json

    class << self
      def get_with_log(url, api_key, params={})
        call_intelipost(api_key, :get, url, params)
      end

      def post_with_log(url, api_key, params={})
        call_intelipost(api_key, :post, url, params)
      end

      private
      def call_intelipost(api_key, action, url, params)
        $logger.info ("[info] calling intelipost with #{action.to_s.upcase}: #{url}, #{params.to_s}")
        response = self.send(action, url, params_with_apikey(params, api_key))
        $logger.info ("[info] intelipost response from call #{action.to_s.upcase} #{url}, #{params.to_s}: #{response.to_s}")

        response
      end

      private
      def params_with_apikey(params, api_key)
        params.merge({
          :headers => {
            "api_key" => api_key
          }
        })
      end
    end
  end
end
