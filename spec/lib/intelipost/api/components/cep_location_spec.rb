require 'spec_helper'

describe Intelipost::ApiComponents::CepLocation do

  let(:intelipost) {
    Intelipost::Api.new("apikey", :test)
  }

  let(:response_cep_ok) {{
    "status" => "OK",
    "messages" => [ ],
    "content" => {
      "state" => "Sao Paulo",
      "city" => "Sao Paulo",
      "neighborhood" => "Cerqueira Cesar",
      "street" => "Rua Augusta",
      "state_short" => "SP",
      "ibge" => "3550308",
      "bairro" => "Vila Gomes Cardim"
    },
    "time" => "32.1 ms"
  }}

  let(:response_cep_invalid) {{
    "status"=>"OK",
    "messages"=>[
      {"type"=>"INFO", "text"=>"Cep desconhecido", "key"=>"cep.missing"}
    ],
    "time"=>"1.0 ms"
  }}

  it "should retrieve a valid zipcode" do
    allow(Intelipost::Facade).to receive(:get) { response_cep_ok }

    intelipost_address = intelipost.CepLocation.address_complete('01413000')
    expect(intelipost_address.status).to eq "OK"
    expect(intelipost_address.messages).to eq []
    expect(intelipost_address.state).to eq "Sao Paulo"
    expect(intelipost_address.city).to eq "Sao Paulo"
    expect(intelipost_address.neighborhood).to eq "Cerqueira Cesar"
    expect(intelipost_address.street).to eq "Rua Augusta"
    expect(intelipost_address.time).to eq "32.1 ms"
    expect(intelipost_address.ibge).to eq "3550308"
  end

  it "should retrieve an invalid zipcode" do
    allow(Intelipost::Facade).to receive(:get) { response_cep_invalid }
    response = intelipost.CepLocation.address_complete('99999999')
    expect(response.class).to be Intelipost::Models::ErrorResponse
    expect(response.messages.first["key"]).to eq "cep.missing"
  end
end
