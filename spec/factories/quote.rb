FactoryGirl.define do
  factory :quote do
    id 293
    client_id 648278
    origin_zip_code "01419-002"
    destination_zip_code "04180-010"
    status "OK"
    messages []
    time "32.1ms"
    volumes []
    delivery_options []

    after(:build) do |quote|
      quote.volumes = build_list(:volume, 2)
      quote.delivery_options = build_list(:delivery_option, 2)
    end
  end
end
