import { buildSchema } from 'graphql';
const helloSchema = buildSchema(`
  type Query {
    hello: String
  }
  type Mutation {
    hello: String
  }
`);

export default helloSchema;
