import type { Request, Response } from 'express';
import { prismaDb } from '../db.server';

export const getGarages = async (req: Request, res: Response) => {
  try {
    const garages = await prismaDb.garage.findMany();
    res.status(200).json(garages);
  } catch (err) {
    res.status(500).json({ message: err });
  }
};
