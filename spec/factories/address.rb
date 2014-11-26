FactoryGirl.define do
  factory :address do
    status 'OK'
    messages []
    state 'Sao Paulo'
    city 'Sao Paulo'
    neighborhood 'Cerqueira Cesar'
    street 'Rua Augusta, 1977'
    time '23ms'
    state_short 'SP'
    ibge '9832372382'
  end
end
