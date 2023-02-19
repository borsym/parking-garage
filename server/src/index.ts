import express from 'express';

const app = express();
const port = 8800 || process.env.PORT;

app.get('/', async (req, res) => {
  res.send('hello');
});

app.listen(port, async () => {
  console.log(`Server listening on port ${port}.`);
});
