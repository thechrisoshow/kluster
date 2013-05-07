module Kluster
  class Cluster
    include Geocoder::Calculations
    attr_accessor :latitude, :longitude, :pins

    def initialize(initial_pin=nil)
      @pins = [initial_pin]
      @number_of_pins = 1
    end

    def coordinate
      [latitude, longitude]
    end

    def ll
      "#{latitude},#{longitude}"
    end

    def latitude
      center[0]
    end

    def longitude
      center[1]
    end

    def number_of_pins
      @pins.count
    end

    private
    def center
      @center ||= geographic_center(@pins.collect(&:coordinate))
    end
  end
end