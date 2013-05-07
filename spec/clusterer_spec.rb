require 'spec_helper'

class Pin

  def initialize(attrs={})
    @lat = attrs[:lat]
    @lng = attrs[:lng]
  end

  def coordinate
    [@lat, @lng]
  end
end

describe Kluster::Clusterer do

  it "returns nothing if there's nothing" do
    clusterer = Kluster::Clusterer.new([])
    clusterer.clusterize(20).should == []
  end

  it "returns one object if there's only one" do
    pin = Pin.new
    clusterer = Kluster::Clusterer.new([pin])
    clusterer.clusterize(20).should == [pin]
  end

  it "returns a cluster of two if the pins are in the same place" do
    pin = Pin.new(lat: 0.1, lng: 0.1)
    other_pin = Pin.new(lat: 0.1, lng: 0.1)
    clusterer = Kluster::Clusterer.new([pin, other_pin])
    result = clusterer.clusterize(10)
    result.length.should == 1
    result[0].latitude.should == 0.1
    result[0].longitude.should == 0.1
    result[0].number_of_pins.should == 2
  end

  it "clusters two very close pins" do
    pin = Pin.new(lng: -0.07949243, lat: 51.52628)
    other_pin = Pin.new(lng: -0.0794824, lat: 51.52628)

    clusterer = Kluster::Clusterer.new([pin, other_pin])
    clusterer.clusterize(10).length.should == 1
  end

  it "clusters at right zoom level" do
    lads_pin = Pin.new(lng: -0.0848282966763571, lat: 51.5262816148359)
    vicks_pin = Pin.new(lng: -0.08467794, lat: 51.52645)
    quick_pin = Pin.new(lng: -0.0832336395979703, lat: 51.5265399870011)

    clusterer = Kluster::Clusterer.new([lads_pin, vicks_pin, quick_pin])
    clusterer.clusterize(0.05).length.should == 2
    clusterer.clusterize(1).length.should == 1
  end

end