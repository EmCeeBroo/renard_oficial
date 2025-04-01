import { Router } from 'express';
import { showUser, showUserId, addUser, updateUser, deleteUser } from '../controllers/user.controller.js';
import { verifyToken } from '../middleware/authMiddleware.js';

const router = Router();
const apiName = '/user';

router.route(apiName)
.get(verifyToken,showUser)
.post(addUser);

router.route(`${apiName}/:id`)
.get(showUserId)
.put(updateUser)
.delete(deleteUser);

export default router;