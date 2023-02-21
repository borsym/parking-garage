import { mergeSchemas } from '@graphql-tools/schema';
import resolverHello from './resolvers/hello.resolver';
import helloSchema from './schemas/hello.schema';

const schemas = [helloSchema];
const resolvers = [resolverHello];

const schema = mergeSchemas({
  schemas,
  resolvers: resolvers,
});

export default schema;
