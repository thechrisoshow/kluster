# rewritten from OCMapView bubble clustering

module Kluster
  class Clusterer

    include Geocoder::Calculations

    def initialize(pins)
      @pins = pins
    end

    def clusterize(radius)
      clustered_annotations = []
      @pins.each do |pin|
        is_containing = false
        if clustered_annotations.empty?
          new_cluster = Cluster.new(pin)
          clustered_annotations << new_cluster
        else
          clustered_annotations.each do |cluster|
            if location_near_to_other_location(pin.coordinate, cluster.coordinate, radius)
              is_containing = true
              cluster.pins << pin
              break
            end
          end

          if !is_containing
            new_cluster = Cluster.new(pin)
            clustered_annotations << new_cluster
          end
        end
      end

      return_array = []
      clustered_annotations.each do |cluster|
        if cluster.pins.length <= 1
           return_array << cluster.pins.last
        else
          return_array << cluster
        end
      end
      return_array
    end

    private

    def get_distance(first_location, second_location)
      deltaLat = first_location.latitude - second_location.latitude;
      deltaLon = first_location.longitude - second_location.longitude;
      distance = Math.sqrt(deltaLat*deltaLat + deltaLon*deltaLon);

      return distance;
    end

    def location_near_to_other_location(first_coordinate, second_coordinate, radius)
      distance = distance_between(first_coordinate, second_coordinate, {units: :km})
      (distance <= radius)
    end

  end
end