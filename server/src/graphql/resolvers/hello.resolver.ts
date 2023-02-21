const resolverHello = {
  Query: {
    hello: () => {
      return 'Hello, world!';
    },
  },

  Mutation: {
    hello: () => {
      return 'Hello, world!';
    },
  },
};

export default resolverHello;
