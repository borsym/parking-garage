# parking garage

in the UI the user can create the design of the parking garage, mark the spots to be car,truck,bike,motorcycle
and after that it would show the users the parking spaces for the vehicles

this can be used for restaurants, malls, and other places where there is a need for parking spaces

In the UI u can put up motorcycle,bike,car parking places, you can make a grid of parking places and then you can put up the price for each parking place, and then you can make a reservation for the parking place, and then you can pay for the parking place, and then you can cancel the reservation for the parking place

The admin can create new parking places, and the admin can see the reservations for the parking places, and the admin can see the payments for the parking places, and the admin can see the users for the parking places. The admin can create the 1/1 copy of the real parking space to the UI

The user can see the parking places, and the user can make a reservation for the parking place, and the user can pay for the parking place, and the user can cancel the reservation for the parking place -> paying is not neccessary because-> if its a restaurant parking reservation its free, if its a mall parking reservation its free, if its a parking garage parking reservation its not free

API endpoints

- /api/parking-garage
- /api/parking-garage/{id}
- /api/parking-garage/{id}/spots
- /api/parking-garage/{id}/spots/{id}
- /api/reservation
- /api/reservation/{id}
- /api/payment
- /api/cancel/{id}
- /api/create-account

Database tables:
Reservation

- id
- garage_id
- spot_id
- user_id
- start_time
- end_time
<!-- - payment_id maybe-->

Parking Garage

- id
- name
- address
- city
- zip
- country
- spots

Spots

- id
- garage_id
- type
- price
- is_available
- vehicle_type

User??

- id
- name
- email
- password

Vehicle

- id
- user_id
- type
- plate_number

future plans:

- image detection for the vehicles that entered and leaved the parking garage

for database UML diagram:
npx prisma generate
https://dbdiagram.io/d/63f49c83296d97641d828fe2
