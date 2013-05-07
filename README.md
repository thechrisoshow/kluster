# Kluster

Ever try to display annotations on a map, but find you have too many?

Kluster can help!

It'll take a bunch of pins that have a latitude and longitude, and decide whether they're too close together or not. If so, it'll create a cluster of em.

Sweet

## Installation

Add this line to your application's Gemfile:

    gem 'kluster'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install kluster

## Usage

Give kluster an array of objects that have a coordinate field and it'll spit back the array with some clusters.

The only parameter it takes is the radius of how big you want the cluster to look in KMs.

e.g.

    clusterer = Clusterer.new(@pins)
    @clustered_pins = clusterer.clusterize(params[:cluster_radius].to_f)

## Dependencies
Kluster uses handy distance methods from the geocoder gem

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
