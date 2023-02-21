import express from 'express';
import dotenv from 'dotenv';
import morgan from 'morgan';
import cors from 'cors';
import { graphqlHTTP } from 'express-graphql';
import schema from './graphql/schema';

dotenv.config();
const app = express();
const PORT = parseInt(process.env.PORT as string, 10) || 8800;

app.use(express.json());
app.use(morgan('dev'));
app.use(cors());

app.use(
  '/graphql',
  graphqlHTTP({
    schema: schema,
    graphiql: process.env.NODE_ENV === 'development',
  })
);
// app.use('/api/v1/garage', garageRouter);

app.listen(PORT, async () => {
  console.log(`Server listening on port ${PORT}.`);
});
