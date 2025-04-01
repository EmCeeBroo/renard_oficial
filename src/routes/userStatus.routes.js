import { Router } from 'express';
import { showUserStatus, showUserStatusId, addUserStatus, updateUserStatus, deleteUserStatus } from '../controllers/userStatus.controller.js';

const router = Router();
const apiName = '/userStatus';

router.route(apiName)
.get(showUserStatus)
.post(addUserStatus);

router.route(`${apiName}/:id`)
.get(showUserStatusId)
.put(updateUserStatus)
.delete(deleteUserStatus);

export default router;