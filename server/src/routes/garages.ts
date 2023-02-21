import express from 'express';
import { getGarages } from '../controllers/garages';

const router = express.Router();

router.get('/', getGarages);

export default router;
