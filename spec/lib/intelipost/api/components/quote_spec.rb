require 'spec_helper'

describe Intelipost::ApiComponents::Quote do

  let(:intelipost) {
    Intelipost::Api.new("apikey", :test)
  }

  let(:raw_quote) {
    {
       "status" => "OK",
       "messages" => [],
       "content" => {
          "id" => 1022029,
          "client_id" => 243,
          "origin_zip_code" => "04180-010",
          "destination_zip_code" => "01419-002",
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

  let(:volumes_object_array) {
    [build(:volume)]
    # volumes_array.inject([]) { |res, v|
    #   res << Intelipost::Models::Volume.new(v)
    # }
  }

  it "should create a quote" do
    allow(Intelipost::Facade).to receive(:post) { raw_quote }
    quote = intelipost.Quote.create('04180-010', '014190-002', volumes_object_array)

    expect(quote.status).to eq "OK"
    expect(quote.messages).to eq []
    expect(quote.id).to eq 1022029
    expect(quote.client_id).to eq 243
    expect(quote.time).to eq "19.9 ms"
    expect(quote.origin_zip_code).to eq '04180-010'
    expect(quote.destination_zip_code).to eq '01419-002'
  end

  it "should generate json request object for quote" do
    expect(intelipost.Quote.request_json('01419002', '04180010', volumes_object_array)).to eq({
       "origin_zip_code" => "01419002",
       "destination_zip_code" => "04180010",
       "volumes" => [
         {
          "weight" => 2.0,
          "volume_type" => "BOX",
          "cost_of_goods" => 30.99,
          "width" => 20.0,
          "height" => 10.0,
          "length" => 25.0
         }
       ]
    })
  end
end
