FactoryGirl.define do
  factory :delivery_option do
    delivery_method_id 1
    delivery_estimate_business_days 4
    provider_shipping_cost 17.4
    final_shipping_cost 17.4
    description "Correios PAC"
    logistic_provider_name "CORREIOS"
    delivery_method_type "STANDARD"
    delivery_method_name "Correios PAC"
  end
end
