import {Router } from 'express';
import { showCategoriaMenu, showCategoriaMenuId, addCategoriaMenu, updateCategoriaMenu, deleteCategoriaMenu } from '../controllers/categoriaMenuController.js';

const router = Router();
const apiRenard ='/categoria-menu'

router.route(apiRenard)
.get(showCategoriaMenu)  // Get all profile
.post(addCategoriaMenu); // Add profile

router.route(`${apiRenard}/:id`)
.get(showCategoriaMenuId)  // Get profile by Id
.put(updateCategoriaMenu)  // Update profile by Id
.delete(deleteCategoriaMenu); // Delete profile by Id

export default router;
