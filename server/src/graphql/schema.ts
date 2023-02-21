import { mergeSchemas } from '@graphql-tools/schema';
import resolverHello from './resolvers/hello.resolver';
import helloSchema from './schemas/hello.schema';
import garageSchema from './schemas/garage.schema';
import garageResolver from './resolvers/garage.resolver';

const schemas = [helloSchema, garageSchema];
const resolvers = [resolverHello, garageResolver];

const schema = mergeSchemas({
  schemas,
  resolvers: resolvers,
});

export default schema;
