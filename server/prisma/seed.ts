import { prismaDb } from '../src/db.server';

// create random email
function randomEmail() {
  const randomString =
    Math.random().toString(36).substring(2, 15) +
    Math.random().toString(36).substring(2, 15);
  return randomString + '@example.com';
}

async function seedDatabase() {
  // Create some users
  const user1 = await prismaDb.user.create({
    data: {
      email: randomEmail(),
      name: 'John Doe',
      password: 'password123',
      role: 'USER',
    },
  });
  const user2 = await prismaDb.user.create({
    data: {
      email: randomEmail(),
      name: 'Jane Smith',
      password: 'password456',
      role: 'USER',
    },
  });

  // Create a garage
  const garage1 = await prismaDb.garage.create({
    data: {
      name: 'Central Parking',
      zipcode: '12345',
      address: '123 Main St.',
      country: 'USA',
      city: 'New York',
    },
  });

  const garage2 = await prismaDb.garage.create({
    data: {
      name: 'Downtown Garage',
      zipcode: '67890',
      address: '456 Elm St.',
      country: 'USA',
      city: 'San Francisco',
    },
  });

  // Create some spots
  const spot1 = await prismaDb.spot.create({
    data: {
      garage: { connect: { id: garage1.id } },
      status: 'RESERVED',
      vehicleType: ['CAR', 'MOTORCYCLE'],
    },
  });

  const spot2 = await prismaDb.spot.create({
    data: {
      garage: { connect: { id: garage1.id } },
      status: 'AVAILABLE',
      vehicleType: ['CAR'],
    },
  });

  const spot3 = await prismaDb.spot.create({
    data: {
      garage: { connect: { id: garage2.id } },
      status: 'RESERVED',
      vehicleType: ['CAR'],
    },
  });

  // Create a vehicle
  const vehicle1 = await prismaDb.vehicle.create({
    data: {
      user: { connect: { id: user1.id } },
      type: 'CAR',
      plate: 'ABC123',
    },
  });

  const vehicle2 = await prismaDb.vehicle.create({
    data: {
      user: { connect: { id: user2.id } },
      type: 'MOTORCYCLE',
      plate: 'XYZ789',
    },
  });

  // Create a reservation
  const reservation1 = await prismaDb.reservation.create({
    data: {
      user: { connect: { id: user1.id } },
      garage: { connect: { id: garage1.id } },
      spot: { connect: { id: spot1.id } },
      vehicle: { connect: { id: vehicle1.id } },
      startDate: new Date('2023-02-25T10:00:00Z'),
      endDate: new Date('2023-02-25T11:00:00Z'),
    },
  });

  const reservation2 = await prismaDb.reservation.create({
    data: {
      user: { connect: { id: user2.id } },
      garage: { connect: { id: garage2.id } },
      spot: { connect: { id: spot3.id } },
      vehicle: { connect: { id: vehicle2.id } },
      startDate: new Date('2023-03-01T12:00:00Z'),
      endDate: new Date('2023-03-01T14:00:00Z'),
    },
  });
}

seedDatabase()
  .then(async () => {
    await prismaDb.$disconnect();
  })
  .catch(async (e) => {
    console.error(e);
    await prismaDb.$disconnect();
    process.exit(1);
  });
