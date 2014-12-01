# Intelipost::Api

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'intelipost-api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install intelipost-api

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it ( https://github.com/[my-github-username]/intelipost-api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## API Structure

The idea is to keep the api very close to the real HTTP urls:
Every subset of data must become a Unique Intelipost::Api::Model, some example of subsets:
  - Volume
  - DeliveryOption

The convention for the APIs is the same: Don't pass a JSON/Hash a facade param, since JSONs/Hashs, may become complex grouping of data.

Done:

- Intelipost::Api::CepLocation.address_complete(zipcode)
- Intelipost::Api::Quote.create(origin_zipcode, destination_zipcode, volumes(object))

Undone:

- Intelipost::Api::Tracking.create()
- Intelipost::Api::Quote.find()
- Intelipost::Api::ShipmentOrder.create()
- Intelipost::Api::ShipmentOrder.find()
- Intelipost::Api::ShipmentOrder.cancel()
- Intelipost::Api::ShipmentOrder.end_customer()
- Intelipost::Api::ShipmentOrder.invoice_data()
- Intelipost::Api::ShipmentOrder.get_label()
- Intelipost::Api::ShipmentOrder.get_volumes()
- Intelipost::Api::ShipmentOrder.read_status()
- Intelipost::Api::ShipmentOrder.ready_for_shipment()
- Intelipost::Api::ShipmentOrder.set_invoice()
- Intelipost::Api::ShipmentOrder.set_tracking_data()
- Intelipost::Api::ShipmentOrder.set_volume()
- Intelipost::Api::ShipmentOrder.shipped()
