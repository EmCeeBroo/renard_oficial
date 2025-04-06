import { Router } from 'express';
import { showUsuario, showUsuarioId, addUsuario, updateUsuario, deleteUsuario } from '../controllers/usuarioController.js';
import { verifyToken } from '../middleware/authMiddleware.js';

const router = Router();
const apiRenard = '/user';


router.route(apiRenard)
  .get(verifyToken,showUsuario) // Get user
  .post(addUsuario); // Add user

router.route(`${apiRenard}/:id`)
  .get(showUsuarioId)  // Get user by Id
  .put(updateUsuario)  // Update user by Id
  .delete(deleteUsuario); // Delete user by Id

export default router;