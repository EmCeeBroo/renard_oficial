import { Router } from 'express';
import { loginApiUser, registerApiUser } from '../controllers/apiUser.controller.js';

const router = Router();
//const apiName = '/apiUser';


//Endpoint para autenticacion (Login)
//router.route(apiName)
//.post(`${apiName}/login`, loginApiUser);
router.post('/login', loginApiUser);
router.post('/register', registerApiUser);

export default router;