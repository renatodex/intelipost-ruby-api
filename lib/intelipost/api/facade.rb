module Intelipost
  class Facade
    include ::HTTParty
    base_uri 'https://api.intelipost.com.br'
    default_params :token => "test"
    format :json
  end
end
