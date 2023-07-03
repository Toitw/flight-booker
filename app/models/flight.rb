class Flight < ApplicationRecord
    belongs_to :departure_airport, class_name: 'Airport'
    belongs_to :arrival_airport, class_name: 'Airport'
    validates :departure_airport_id, presence: true
    validates :arrival_airport_id, presence: true

    def event_date_formatted
        departure_time.strftime("%m/%d/%Y")
    end

    def self.available_dates(departure_airport_id, arrival_airport_id)
        where(departure_airport_id: departure_airport_id, arrival_airport_id: arrival_airport_id)
          .pluck('DISTINCT DATE(start) AS event_date')
    end
end
