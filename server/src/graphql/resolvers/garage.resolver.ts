import { prismaDb } from '../../db.server';

const garageResolver = {
  Query: {
    garages: async () => {
      return await prismaDb.garage.findMany({
        select: {
          id: true,
          name: true,
          city: true,
        },
      });
    },
  },

  // garage: async (_parent, { id }) => {
  //   return await prismaDb.garage.findUnique({
  //     where: { id },
  //     include: {
  //       spots: true,
  //       reservations: true,
  //     },
  //   });
  // },
  // Mutation: {
  //   createGarage: async (_parent, { data }) => {
  //     const { name, zipcode, address, country, city } = data;

  //     return await prismaDb.garage.create({
  //       data: { name, zipcode, address, country, city },
  //       include: {
  //         spots: true,
  //         reservations: true,
  //       },
  //     });
  //   },
  //   updateGarage: async (_parent, { id, data }) => {
  //     return await prismaDb.garage.update({
  //       where: { id },
  //       data,
  //       include: {
  //         spots: true,
  //         reservations: true,
  //       },
  //     });
  //   },
  //   deleteGarage: async (_parent, { id }) => {
  //     return await prismaDb.garage.delete({
  //       where: { id },
  //       include: {
  //         spots: true,
  //         reservations: true,
  //       },
  //     });
  //   },
  // },
  // Garage: {
  //   spots: async (parent) => {
  //     return await prismaDb.spot.findMany({
  //       where: { garageId: parent.id },
  //       include: {
  //         vehicleType: true,
  //         reservation: true,
  //       },
  //     });
  //   },
  //   reservations: async (parent) => {
  //     return await prismaDb.reservation.findMany({
  //       where: { garageId: parent.id },
  //       include: {
  //         user: true,
  //         garage: true,
  //         spot: true,
  //         vehicle: true,
  //       },
  //     });
  //   },
  // },
};

export default garageResolver;
