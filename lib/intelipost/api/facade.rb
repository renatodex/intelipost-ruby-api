module Intelipost
  module Api
    class Facade
      include ::HTTParty
      base_uri 'https://api.intelipost.com.br'
      format :json
    end
  end
end
