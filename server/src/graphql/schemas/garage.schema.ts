import { buildSchema } from 'graphql';
const garageSchema = buildSchema(`
  type Query {
    garages: [Test!]!
  }

  type Test {
    id: String!
    name: String!
    city: String!
  }

  type Garage {
    id: String!
    name: String!
    zipcode: String!
    address: String!
    country: String!
    city: String!
    spots: [Spot!]!
    reservations: [Reservation!]!
  }

  enum VehicleType {
    CAR
    MOTORCYCLE
    BIKE
  }
  
  enum UserRole {
    ADMIN
    USER
  }

  type Vehicle {
    id: String!
    user: User!
    type: VehicleType!
    plate: String!
    reservations: [Reservation!]!
  }
  
  type User {
    id: String!
    email: String!
    name: String!
    password: String!
    role: UserRole!
    reservations: [Reservation!]!
    vehicles: [Vehicle!]!
  }
  
  enum SpotStatus {
    AVAILABLE
    RESERVED
    OCCUPIED
  }
  
  type Spot {
    id: String!
    garage: Garage!
    status: SpotStatus!
    vehicleType: [VehicleType!]!
    reservations: [Reservation!]!
  }  

  type Reservation {
    id: String!
    user: User!
    garage: Garage!
    spot: Spot!
    vehicle: Vehicle!
    startDate: String!
    endDate: String!
  }
`);

export default garageSchema;
// type quary {
// garage(id: String!): Garage
// }
// type Mutation {
//   createGarage(data: CreateGarageInput!): Garage!
//   updateGarage(id: String!, data: UpdateGarageInput!): Garage!
//   deleteGarage(id: String!): Garage!
// }

// input UpdateGarageInput {
//   name: String
//   zipcode: String
//   address: String
//   country: String
//   city: String
// }
