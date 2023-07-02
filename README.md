# Flight Booker

Flight Booker is a web application built with Ruby on Rails that allows users to search for available flights, select a flight, and provide passenger information for booking.

## Setup

1. Clone the repository and navigate to the project directory.

2. Install the required dependencies by running the following command:

   ```
   bundle install
   ```

3. Set up the database by running the migrations:

   ```
   rails db:migrate
   ```

4. Populate the database with sample data by running the seed file:

   ```
   rails db:seed
   ```

5. Start the Rails server:

   ```
   rails server
   ```

6. Open your web browser and visit `http://localhost:3000` to access the application.

## Screens

### Screen 1: Search

On the search screen, users can search for available flights based on their preferences.

- Select the departure airport, arrival airport, number of passengers, and flight date using the dropdown menus.
- The dropdown menus for airports will display all available airports.
- The flight date dropdown will only show dates that have existing flights.

### Screen 2: Pick a Flight

After submitting the search form, users will be shown a list of available flights based on their search criteria.

- The search form remains active at the top, allowing users to run a new search if needed.
- Each flight will be displayed with a radio button for selection.
- Users can choose one flight from the list.

### Screen 3: Passenger Information

Once a flight is selected, users will provide passenger information for booking.

- The booking form will display the chosen flight details, including the date and airports.
- Users can enter passenger information such as name and email.
- Multiple passenger forms will be available based on the number of passengers selected in the search.

## Models

### Airport

The Airport model represents an airport.

- Attributes:
  - code: string (the airport code, e.g., "SFO")

### Flight

The Flight model represents a flight.

- Attributes:
  - departure_airport_id: integer (foreign key to the departure airport)
  - arrival_airport_id: integer (foreign key to the arrival airport)
  - start: datetime (the departure time)
  - duration: integer (the duration of the flight in minutes)

- Associations:
  - departure_airport: Airport
  - arrival_airport: Airport

### Booking

The Booking model represents a flight booking.

- Attributes:
  - flight_id: integer (foreign key to the flight)

- Associations:
  - flight: Flight
  - passengers: Passenger (nested attributes)

### Passenger

The Passenger model represents a passenger associated with a booking.

- Attributes:
  - name: string
  - email: string

- Associations:
  - booking: Booking

## Controllers

### FlightsController

The FlightsController handles flight-related actions, including flight search and displaying search results.

- Actions:
  - index: Displays the flight search form and search results.

### BookingsController

The BookingsController handles booking-related actions, including displaying the booking form and creating a new booking.

- Actions:
  - new: Displays the booking form for passenger information.
  - create: Creates a new booking with associated passengers.

## Contributing

Contributions to Flight Booker are welcome! If you find any issues or have suggestions for improvements, please feel free to open an issue or submit a pull request.

## License

Flight Booker is released under the [MIT License](https://opensource.org/licenses/MIT).

Enjoy using Flight Booker! If you have any questions, feel free to reach out.

Note: This README is a template and should be updated with