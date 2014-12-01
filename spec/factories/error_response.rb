FactoryGirl.define do
  factory :error_response do
    status 'ERROR'
    messages [{"type"=>"INFO", "text"=>"Erro desconhecido", "key"=>"unknown.error"}]
    time '12ms'
  end
end
