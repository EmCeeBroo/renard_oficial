import {Router} from 'express';
import { showReservaciones, showReservacionId, addReservacion, updateReservacion, deleteReservacion, } from '../controllers/reservacionController.js';

const router = Router();
const apiRenard='/reservaciones';

router.route(apiRenard)
.get(showReservaciones)  // Get all profile
.post(addReservacion); // Add profile

router.route(`${apiRenard}/:id`)
.get(showReservacionId)  // Get profile by Id
.put(updateReservacion)  // Update profile by Id
.delete(deleteReservacion); // Delete profile by Id

export default router;
