require 'spec_helper'

describe Intelipost::ApiComponents::Quote do

  let(:intelipost) {
    Intelipost::Api.new("apikey")
  }

  let(:raw_quote) {
    {
       "status" => "OK",
       "messages" => [],
       "content" => {
          "id" => 1022029,
          "client_id" => 243,
          "origin_zip_code" => "04037-002",
          "destination_zip_code" => "20920-440",
          "delivery_options" =>[{
              "delivery_method_id" => 1,
              "delivery_estimate_business_days" => 4,
              "provider_shipping_cost" => 17.4,
              "final_shipping_cost" => 17.4,
              "description" => "Correios PAC",
              "logistic_provider_name" => "CORREIOS",
              "delivery_method_type" => "STANDARD",
              "delivery_method_name" => "Correios PAC"
          }],
          "volumes" =>[{
              "weight" => 2,
              "cost_of_goods" => 30.99,
              "width" => 20,
              "height" => 10,
              "length" => 25,
              "volume_type" => "BOX"
          }]
       },
       "time" => "19.9 ms"
    }
  }

  let(:volumes_array) {
    [{
      "weight" => 2.0,
      "volume_type" => "BOX",
      "cost_of_goods" => 30.99,
      "width" => 20.0,
      "height" => 10.0,
      "length" => 25.0
    }]
  }

  it "should create a quote" do
    #allow(Intelipost::Facade).to receive(:get) { raw_quote }
    quote = intelipost.Quote.create('01419002', '04180010', volumes_array)
    expect(quote.status).to eq "OK"
    expect(quote.messages).to eq []
    expect(quote.id).to eq 1022029
    expect(quote.client_id).to eq 243
    expect(quote.time).to eq "19.9 ms"
    expect(quote.origin_zip_code).to eq '01419002'
    expect(quote.destination_zip_code).to eq '04180010'
  end
end
