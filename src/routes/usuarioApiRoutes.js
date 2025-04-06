import { Router } from 'express';
import { showusuarioApi, showusuarioApiId, addusuarioApi, updateusuarioApi, deleteusuarioApi, loginusuarioApi } from '../controllers/usuarioApiController.js';

const router = Router();
const apiRenard = '/usuarioApi';

router.route(apiRenard)
  .get(showusuarioApi)  // Get all user
  .post(addusuarioApi); // Add user

router.route('/usuarioApiLogin')
  .post(loginusuarioApi); // Login

router.route(`${apiName}/:id`)
  .get(showusuarioApiId)  // Get user by Id
  .put(updateusuarioApi)  // Update user by Id
  .delete(deleteusuarioApi); // Delete user by Id

export default router;